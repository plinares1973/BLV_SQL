USE [master]
GO
/****** Object:  Database [BLV]    Script Date: 28/8/2023 11:09:42 p. m. ******/
CREATE DATABASE [BLV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BLV', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BLV.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BLV_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BLV_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BLV] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BLV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BLV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BLV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BLV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BLV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BLV] SET ARITHABORT OFF 
GO
ALTER DATABASE [BLV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BLV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BLV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BLV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BLV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BLV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BLV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BLV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BLV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BLV] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BLV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BLV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BLV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BLV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BLV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BLV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BLV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BLV] SET RECOVERY FULL 
GO
ALTER DATABASE [BLV] SET  MULTI_USER 
GO
ALTER DATABASE [BLV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BLV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BLV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BLV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BLV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BLV] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BLV', N'ON'
GO
ALTER DATABASE [BLV] SET QUERY_STORE = OFF
GO
USE [BLV]
GO
/****** Object:  Schema [Compra]    Script Date: 28/8/2023 11:09:42 p. m. ******/
CREATE SCHEMA [Compra]
GO
/****** Object:  Schema [Costo]    Script Date: 28/8/2023 11:09:42 p. m. ******/
CREATE SCHEMA [Costo]
GO
/****** Object:  Schema [Importacion]    Script Date: 28/8/2023 11:09:42 p. m. ******/
CREATE SCHEMA [Importacion]
GO
/****** Object:  Schema [Parametro]    Script Date: 28/8/2023 11:09:42 p. m. ******/
CREATE SCHEMA [Parametro]
GO
/****** Object:  Schema [Proceso]    Script Date: 28/8/2023 11:09:42 p. m. ******/
CREATE SCHEMA [Proceso]
GO
/****** Object:  Schema [Produccion]    Script Date: 28/8/2023 11:09:42 p. m. ******/
CREATE SCHEMA [Produccion]
GO
/****** Object:  Schema [Relacion]    Script Date: 28/8/2023 11:09:42 p. m. ******/
CREATE SCHEMA [Relacion]
GO
/****** Object:  Schema [Sistema]    Script Date: 28/8/2023 11:09:42 p. m. ******/
CREATE SCHEMA [Sistema]
GO
/****** Object:  Schema [Venta]    Script Date: 28/8/2023 11:09:42 p. m. ******/
CREATE SCHEMA [Venta]
GO
/****** Object:  Table [Produccion].[Medida]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Medida](
	[id_medida] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
	[unidad] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_medida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Sistema].[vw_medida]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Sistema].[vw_medida] AS
SELECT 
	id_medida 
	,descripcion as MEDIDA
FROM Produccion.medida
GO
/****** Object:  Table [Produccion].[Capacidad_Envase]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Capacidad_Envase](
	[id_capacidad_envase] [int] IDENTITY(1,1) NOT NULL,
	[id_empaque] [int] NOT NULL,
	[capacidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_capacidad_envase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produccion].[Empaque]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Empaque](
	[id_empaque] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](40) NULL,
	[id_medida_envase] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_empaque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Sistema].[vw_empaque]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Sistema].[vw_empaque] AS
SELECT 
	e.id_empaque 
	,e.descripcion as EMPAQUE
	,ce.id_capacidad_envase
	,e.id_medida_envase
FROM 
	Produccion.empaque E
	INNER JOIN Produccion.Capacidad_envase CE ON CE.id_empaque=E.id_empaque;
GO
/****** Object:  Table [Relacion].[Pais_Continente]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Pais_Continente](
	[id_pais_continente] [int] IDENTITY(1,1) NOT NULL,
	[id_pais] [int] NULL,
	[id_continente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pais_continente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sistema].[Division_Politica]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Division_Politica](
	[id_division_politica] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_division_politica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sistema].[Pais]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Pais](
	[id_pais] [int] NOT NULL,
	[nombre] [varchar](60) NULL,
	[prefijo_telefonico] [varchar](1) NULL,
	[iso] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sistema].[Ciudad]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Ciudad](
	[id_ciudad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sistema].[Continente]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Continente](
	[id_continente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_continente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[DP_Ciudad]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[DP_Ciudad](
	[id_dp_ciudad] [int] IDENTITY(1,1) NOT NULL,
	[id_division_politica] [int] NULL,
	[id_ciudad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_dp_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Pais_DP]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Pais_DP](
	[id_pais_dp] [int] IDENTITY(1,1) NOT NULL,
	[id_division_politica] [int] NULL,
	[id_pais] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pais_dp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Sistema].[vw_ciudades]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [Sistema].[vw_ciudades]
AS
	SELECT
		cc.nombre AS 'CONTINENTE'
		,p.nombre AS 'PAIS'
		,dp.nombre AS 'ESTADO'
		,c.nombre AS 'CIUDAD'
		,c.id_ciudad AS 'ID_CIUDAD'
	FROM
		Sistema.Continente cc
		INNER JOIN Relacion.Pais_Continente rpc ON rpc.id_continente=cc.id_continente
		INNER JOIN Sistema.Pais p ON p.id_pais=rpc.id_pais
		INNER JOIN Relacion.Pais_DP rdp ON rdp.id_pais=p.id_pais
		INNER JOIN Sistema.Division_Politica dp ON dp.id_division_politica=rdp.id_division_politica
		INNER JOIN Relacion.DP_Ciudad rdc ON rdc.id_division_politica=dp.id_division_politica
		INNER JOIN Sistema.Ciudad c ON c.id_ciudad=rdc.id_ciudad
GO
/****** Object:  Table [Relacion].[Deposito_Ciudad]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Deposito_Ciudad](
	[id_deposito_ciudad] [int] IDENTITY(1,1) NOT NULL,
	[id_deposito] [int] NULL,
	[id_ciudad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_deposito_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sistema].[Deposito]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Deposito](
	[id_deposito] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](70) NULL,
	[domicilio] [varchar](40) NULL,
	[telefono] [varchar](20) NULL,
	[fax] [varchar](20) NULL,
	[mail] [varchar](40) NULL
) ON [PRIMARY]
GO
/****** Object:  View [Sistema].[VW_Depositos]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		CREATE VIEW [Sistema].[VW_Depositos] AS
		SELECT
			d.nombre
			,d.domicilio
			,d.telefono
			,d.fax
			,d.mail
			,v.CIUDAD
			,v.estado
	
		FROM 
			sistema.deposito d 
			INNER JOIN Relacion.Deposito_ciudad c ON c.id_deposito=d.id_deposito
			INNER JOIN Sistema.vw_ciudades v ON v.ID_CIUDAD=c.id_ciudad
GO
/****** Object:  Table [Compra].[Certificado_COA]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compra].[Certificado_COA](
	[id_certificado_coa] [int] IDENTITY(1,1) NOT NULL,
	[certificado_coa] [nvarchar](255) NULL,
	[fecha_certificado_coa] [smalldatetime] NULL,
	[id_ocompra_producto] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Compra].[Lote]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compra].[Lote](
	[id_batch] [int] IDENTITY(1,1) NOT NULL,
	[codigo_lote] [varchar](20) NULL,
	[codigo_producto] [varchar](10) NULL,
	[fecha_elaboracion] [smalldatetime] NULL,
	[fecha_vencimiento] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_batch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Compra].[OC_Insumo_Header]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compra].[OC_Insumo_Header](
	[id_oc_insumo_header] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_oc_insumo_header] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Compra].[Orden_Compra]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compra].[Orden_Compra](
	[id_orden_compra] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [smalldatetime] NULL,
	[codigo_importacion] [nvarchar](50) NULL,
	[certificado_libre circulacion] [nvarchar](255) NULL,
	[fecha_libre_circulacion] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_orden_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Compra].[orden_compra_insumo]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compra].[orden_compra_insumo](
	[id_ocompra_insumo] [int] IDENTITY(1,1) NOT NULL,
	[marca] [varchar](50) NULL,
	[monto] [float] NULL,
	[cantidad] [int] NULL,
	[id_oc_insumo_header] [int] NULL,
	[id_stock_insumo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ocompra_insumo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Compra].[Orden_Compra_Producto]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compra].[Orden_Compra_Producto](
	[id_ocompra_producto] [int] IDENTITY(1,1) NOT NULL,
	[id_orden_compra] [int] NULL,
	[codigo_producto] [varchar](10) NULL,
	[marca] [varchar](50) NULL,
	[cantidad] [int] NULL,
	[monto] [float] NULL,
	[derecho_importacion] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ocompra_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Compra].[Proveedor]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compra].[Proveedor](
	[id_proveedor] [int] IDENTITY(1,1) NOT NULL,
	[razon_social] [varchar](70) NULL,
	[domicilio] [varchar](40) NULL,
	[telefono] [varchar](20) NULL,
	[fax] [varchar](20) NULL,
	[mail] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Costo].[Concepto_Header]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Costo].[Concepto_Header](
	[id_concepto_header] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NULL,
	[descripcion] [varchar](200) NULL,
	[id_pais_origen] [int] NULL,
	[id_tipo_valor] [int] NULL,
	[id_tipo_concepto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_concepto_header] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Costo].[Perfil_Costo]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Costo].[Perfil_Costo](
	[id_perfil_costo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NULL,
	[descripcion] [varchar](200) NULL,
	[fecha_creacion] [smalldatetime] NULL,
	[fecha_baja] [smalldatetime] NULL,
	[vigente] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_perfil_costo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Costo].[Secuencia_Perfil]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Costo].[Secuencia_Perfil](
	[id_secuencia_perfil] [int] IDENTITY(1,1) NOT NULL,
	[id_perfil_costo] [int] NULL,
	[orden] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_secuencia_perfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Costo].[Tasa_Concepto]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Costo].[Tasa_Concepto](
	[id_tasa_concepto] [int] IDENTITY(1,1) NOT NULL,
	[valor] [float] NULL,
	[id_concepto_header] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tasa_concepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Costo].[Tipo_Concepto]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Costo].[Tipo_Concepto](
	[id_tipo_concepto] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tipo_concepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Costo].[Tipo_Valor]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Costo].[Tipo_Valor](
	[id_tipo_concepto] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tipo_concepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Parametro].[Certificado]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Parametro].[Certificado](
	[id_certificado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_certificado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Parametro].[Compra]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Parametro].[Compra](
	[id_parametro] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[valor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_parametro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Parametro].[Ruta]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Parametro].[Ruta](
	[id_ruta] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[ruta] [varchar](150) NULL,
	[id_certificado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ruta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[Costo_a_Calcular]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Costo_a_Calcular](
	[id_orden_compra] [int] NULL,
	[orden] [int] NULL,
	[id_concepto_header] [int] NULL,
	[id_tipo_valor] [int] NULL,
	[valor] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[Estado]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Estado](
	[id_estado] [int] IDENTITY(0,1) NOT NULL,
	[descripcion] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[Hoja_Fabricacion]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Hoja_Fabricacion](
	[id_proceso_hf] [int] IDENTITY(1,1) NOT NULL,
	[id_hoja_fabrica] [int] NULL,
	[codigo_producto] [varchar](10) NULL,
	[cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_proceso_hf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[Relacion_Tablones]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Relacion_Tablones](
	[id_tablon_impacto_stock] [int] NULL,
	[id_tablon_impacto_deposito] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[Tablon_Impacto_Deposito]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Tablon_Impacto_Deposito](
	[id_tablon_impacto_deposito] [int] IDENTITY(1,1) NOT NULL,
	[id_deposito] [int] NULL,
	[id_stock] [int] NULL,
	[es_cuarentena] [bit] NULL,
	[cantidad_posicion] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[Tablon_Impacto_Stock]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Tablon_Impacto_Stock](
	[id_tablon_impacto_stock] [int] IDENTITY(1,1) NOT NULL,
	[id_compra] [int] NULL,
	[id_ocompra_producto] [int] NULL,
	[numero_importacion] [nvarchar](50) NULL,
	[certificado_libre_circulacion] [nvarchar](255) NULL,
	[fecha_certificado_libre_circulacion] [date] NULL,
	[id_lote] [int] NULL,
	[codigo_producto] [varchar](10) NULL,
	[marca] [varchar](50) NULL,
	[cantidad] [int] NULL,
	[certificado_coa] [nvarchar](255) NULL,
	[fecha_elaboracion] [smalldatetime] NULL,
	[fecha_vencimiento] [smalldatetime] NULL,
	[posiciones_deposito] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Produccion].[Hoja_Fabricacion_Header]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Hoja_Fabricacion_Header](
	[id_hoja_fabricacion] [int] IDENTITY(1,1) NOT NULL,
	[fecha_creacion_orden] [date] NULL,
	[id_receta] [int] NOT NULL,
	[id_stock_insumo] [int] NULL,
	[cantidad_insumo] [int] NULL,
	[cantidad_fabricar] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Produccion].[Producto]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Producto](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[codigo_producto] [varchar](10) NOT NULL,
	[fecha_elaboracion] [smalldatetime] NULL,
	[fecha_vencimiento] [smalldatetime] NULL,
	[marca] [varchar](40) NULL,
 CONSTRAINT [PK__Producto] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produccion].[Producto_Header]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Producto_Header](
	[codigo_producto] [varchar](10) NOT NULL,
	[nombre_producto] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produccion].[Producto_Marca]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Producto_Marca](
	[id_marca] [int] IDENTITY(1,1) NOT NULL,
	[marca] [varchar](50) NULL,
	[codigo_producto] [varchar](10) NULL,
	[id_pais] [int] NULL,
	[MSDS] [nvarchar](255) NULL,
	[RNPA] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produccion].[Receta]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Receta](
	[id_receta] [int] IDENTITY(1,1) NOT NULL,
	[nombre_receta] [varchar](50) NULL,
	[codigo_producto] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_receta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produccion].[Stock]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Stock](
	[id_stock] [int] IDENTITY(1,1) NOT NULL,
	[piso] [int] NULL,
	[posicion] [int] NULL,
	[altura] [int] NULL,
	[fila] [int] NULL,
	[codigo_barra] [binary](1) NULL,
	[disponible] [bit] NULL,
	[cuarentena] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_stock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produccion].[Stock_Insumo]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produccion].[Stock_Insumo](
	[id_stock_insumo] [int] IDENTITY(1,1) NOT NULL,
	[id_empaque] [int] NULL,
	[id_medida] [int] NULL,
	[cantidad] [int] NULL,
	[id_capacidad] [int] NULL,
	[marca] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_stock_insumo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Cliente_ciudad]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Cliente_ciudad](
	[id_cliente_ciudad] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NULL,
	[id_ciudad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Compra_Estado]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Compra_Estado](
	[id_compra_estado] [int] IDENTITY(1,1) NOT NULL,
	[id_compra] [int] NULL,
	[id_estado] [int] NULL,
	[fecha] [smalldatetime] NULL,
	[vigente] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_compra_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Costo_oc]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Costo_oc](
	[id_costo_oc] [int] IDENTITY(1,1) NOT NULL,
	[id_concepto] [int] NULL,
	[id_orden_compra] [int] NULL,
	[monto] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_costo_oc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Deposito_Stock]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Deposito_Stock](
	[id_deposito_Stock] [int] IDENTITY(1,1) NOT NULL,
	[id_deposito] [int] NULL,
	[id_stock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_deposito_Stock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Derecho_importacion_Producto]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Derecho_importacion_Producto](
	[id_derecho_importacion_producto] [int] IDENTITY(1,1) NOT NULL,
	[id_concepto] [int] NULL,
	[codigo_producto] [varchar](10) NULL,
	[codigo_arancelario] [varchar](12) NULL,
	[tasa] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_derecho_importacion_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Elaborador_Localidad]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Elaborador_Localidad](
	[id_elaborador_ciudad] [int] IDENTITY(1,1) NOT NULL,
	[id_elaborador] [int] NULL,
	[id_localidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_elaborador_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Entidad_Bancaria_Ciudad]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Entidad_Bancaria_Ciudad](
	[id_entidad_bancaria_ciudad] [int] IDENTITY(1,1) NOT NULL,
	[id_banco] [int] NULL,
	[id_ciudad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_entidad_bancaria_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Envio_Estado]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Envio_Estado](
	[id_envio_estado] [int] IDENTITY(1,1) NOT NULL,
	[id_envio] [int] NULL,
	[id_estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_envio_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Hoja_Fab_Estado]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Hoja_Fab_Estado](
	[id_hoja_fab_estado] [int] IDENTITY(1,1) NOT NULL,
	[id_hoja_fabrica] [int] NULL,
	[id_estado] [int] NULL,
	[fecha] [smalldatetime] NULL,
	[vigente] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Ingrediente_Stock]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Ingrediente_Stock](
	[id_ingrediente_stock] [int] IDENTITY(1,1) NOT NULL,
	[id_ingrediente] [int] NULL,
	[id_stock] [int] NULL,
	[cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ingrediente_stock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Localidad_Ciudad]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Localidad_Ciudad](
	[id_localidad_ciudad] [int] IDENTITY(1,1) NOT NULL,
	[id_localidad] [int] NULL,
	[id_ciudad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_localidad_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Lote_Ingrediente]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Lote_Ingrediente](
	[id_batch_ingrediente] [int] IDENTITY(1,1) NOT NULL,
	[id_batch] [int] NULL,
	[id_ingrediente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_batch_ingrediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Lote_Producto]    Script Date: 28/8/2023 11:09:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Lote_Producto](
	[id_lote_producto] [int] IDENTITY(1,1) NOT NULL,
	[id_batch] [int] NULL,
	[id_producto] [int] NULL,
	[cantidad] [int] NULL,
	[id_medida] [int] NULL,
	[id_empaque] [int] NULL,
	[id_capacidad_envase] [int] NULL,
	[cuarentena] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_lote_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Lote_Stock]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Lote_Stock](
	[id_lote_stock] [int] IDENTITY(1,1) NOT NULL,
	[id_batch] [int] NULL,
	[id_stock] [int] NULL,
	[fecha_impacto] [date] NULL,
	[cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_lote_stock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Medio_Pago_Cuenta]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Medio_Pago_Cuenta](
	[id_medio_pago_cuenta] [int] IDENTITY(1,1) NOT NULL,
	[id_medio_pago] [int] NULL,
	[id_cuenta] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_medio_pago_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Medio_Pago_Orden_Compra]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Medio_Pago_Orden_Compra](
	[id_medio_pago_orden_compra] [int] IDENTITY(1,1) NOT NULL,
	[id_medio_pago] [int] NULL,
	[id_orden_compra] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_medio_pago_orden_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Moneda_Orden_Compra]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Moneda_Orden_Compra](
	[id_moneda_orden_compra] [int] IDENTITY(1,1) NOT NULL,
	[id_orden_compra] [int] NULL,
	[id_moneda] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_moneda_orden_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[OC_Producto_Empaque]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[OC_Producto_Empaque](
	[id_ocproducto_empaque] [int] IDENTITY(1,1) NOT NULL,
	[id_ocompra_producto] [int] NULL,
	[id_empaque] [int] NULL,
	[capacidad_envase] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ocproducto_empaque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[OC_Producto_Medida]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[OC_Producto_Medida](
	[id_oc_producto_medida] [int] IDENTITY(1,1) NOT NULL,
	[id_ocompra_producto] [int] NULL,
	[id_medida] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_oc_producto_medida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Orden_Compra_Envio]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Orden_Compra_Envio](
	[id_orden_compra_envio] [int] IDENTITY(1,1) NOT NULL,
	[id_envio] [int] NULL,
	[id_orden_compra] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_orden_compra_envio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Orden_Compra_Lote]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Orden_Compra_Lote](
	[id_orden_compra_lote] [int] IDENTITY(1,1) NOT NULL,
	[id_ocompra_producto] [int] NULL,
	[id_lote] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_orden_compra_lote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Pais_Ciudad]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Pais_Ciudad](
	[id_pais_ciudad] [int] IDENTITY(1,1) NOT NULL,
	[id_pais] [int] NULL,
	[id_ciudad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pais_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Perfil_Concepto]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Perfil_Concepto](
	[id_perfil_concepto] [int] IDENTITY(1,1) NOT NULL,
	[id_perfil_costo] [int] NULL,
	[id_concepto_header] [int] NULL,
	[enlace_concepto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_perfil_concepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Producto_Compra]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Producto_Compra](
	[id_producto_compra] [int] IDENTITY(1,1) NOT NULL,
	[id_producto] [int] NULL,
	[id_ingrediente] [int] NULL,
	[cantidad] [int] NULL,
	[id_medida] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Producto_Elaborador]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Producto_Elaborador](
	[id_producto_elaborador] [int] IDENTITY(1,1) NOT NULL,
	[id_producto] [int] NULL,
	[id_elaborador] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto_elaborador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Producto_Hoja_Fabrica]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Producto_Hoja_Fabrica](
	[id_producto_hoja_fabrica] [int] IDENTITY(1,1) NOT NULL,
	[id_producto] [int] NULL,
	[id_hoja_fabrica] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto_hoja_fabrica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Producto_Importador]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Producto_Importador](
	[id_producto_importador] [int] IDENTITY(1,1) NOT NULL,
	[id_producto] [int] NULL,
	[id_importador] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto_importador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Producto_Marca]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Producto_Marca](
	[id_producto_marca] [int] IDENTITY(1,1) NOT NULL,
	[id_producto] [int] NULL,
	[id_marca] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Producto_Procedencia]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Producto_Procedencia](
	[id_producto_procedencia] [int] IDENTITY(1,1) NOT NULL,
	[id_producto] [int] NULL,
	[id_procedencia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto_procedencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Producto_Receta]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Producto_Receta](
	[id_receta] [int] NULL,
	[codigo_ingrediente_producto] [varchar](10) NULL,
	[cantidad_percentil] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Producto_Venta]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Producto_Venta](
	[id_producto_venta] [int] IDENTITY(1,1) NOT NULL,
	[id_producto] [int] NULL,
	[id_orden_venta] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Proveedor_Ciudad]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Proveedor_Ciudad](
	[id_proveedor_ciudad] [int] IDENTITY(1,1) NOT NULL,
	[id_proveedor] [int] NULL,
	[id_ciudad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_proveedor_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Proveedor_OrdenCompra]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Proveedor_OrdenCompra](
	[id_proveedor_OrdenCompra] [int] IDENTITY(1,1) NOT NULL,
	[id_proveedor] [int] NULL,
	[id_orden_compra] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_proveedor_OrdenCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Stock_Cuarentena]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Stock_Cuarentena](
	[id_stock_cuarentena] [int] IDENTITY(1,1) NOT NULL,
	[id_lote_producto] [int] NULL,
	[id_stock] [int] NULL,
	[id_batch] [int] NOT NULL,
	[fecha_impacto] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_stock_cuarentena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Usuario_Localidad]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Usuario_Localidad](
	[id_usuario_localidad] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[id_localidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario_localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Usuario_Pass]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Usuario_Pass](
	[id_usuario_pass] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[id_pass] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario_pass] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Usuario_Perfil_Acceso]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Usuario_Perfil_Acceso](
	[id_usuario_perfil] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[id_perfil] [int] NULL,
	[id_acceso] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario_perfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Venta_Cliente]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Venta_Cliente](
	[id_venta_cliente] [int] IDENTITY(1,1) NOT NULL,
	[id_orden_venta] [int] NULL,
	[id_cliente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_venta_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Venta_Envio]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Venta_Envio](
	[id_venta_envio] [int] IDENTITY(1,1) NOT NULL,
	[id_venta] [int] NULL,
	[id_envio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_venta_envio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Venta_Remito]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Venta_Remito](
	[id_venta_remito] [int] IDENTITY(1,1) NOT NULL,
	[id_venta] [int] NULL,
	[id_remito] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_venta_remito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sistema].[Acceso]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Acceso](
	[id_acceso] [int] IDENTITY(1,1) NOT NULL,
	[modulo] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_acceso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sistema].[Cuenta]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Cuenta](
	[id_cuenta] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
	[nro_cuenta] [varchar](10) NULL,
	[CBU] [varchar](22) NULL,
	[alias] [varchar](30) NULL,
	[id_banco] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sistema].[Entidad_Bancaria]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Entidad_Bancaria](
	[id_banco] [int] IDENTITY(1,1) NOT NULL,
	[razon_social] [varchar](30) NULL,
	[mail] [varchar](40) NULL,
	[fax] [varchar](20) NULL,
	[telefono] [varchar](20) NULL,
	[domicilio] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_banco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sistema].[Envio]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Envio](
	[id_envio] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_envio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sistema].[Estado]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Estado](
	[id_estado] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sistema].[Localidad]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Localidad](
	[id_localidad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](70) NULL,
	[prefijo_telefonico] [varchar](5) NULL,
	[codigo_postal] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sistema].[Logs]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Logs](
	[id_log] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [smalldatetime] NULL,
	[hora] [smalldatetime] NULL,
	[duracion] [int] NULL,
	[id_acceso] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_log] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sistema].[Medio_Pago]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Medio_Pago](
	[id_medio_pago] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_medio_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sistema].[Moneda]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Moneda](
	[id_moneda] [int] IDENTITY(1,1) NOT NULL,
	[nomenclatura] [varchar](3) NULL,
	[descripcion] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_moneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sistema].[Pass]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Pass](
	[id_pass] [int] IDENTITY(1,1) NOT NULL,
	[clave] [varchar](20) NULL,
	[fecha_alta] [smalldatetime] NULL,
	[vigente] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pass] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sistema].[Perfil]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Perfil](
	[id_perfil] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_perfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sistema].[Usuario]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sistema].[Usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](20) NULL,
	[apellido] [varchar](20) NULL,
	[nombre] [varchar](30) NULL,
	[domicilio] [varchar](40) NULL,
	[telefono] [varchar](20) NULL,
	[dni] [varchar](20) NULL,
	[mail] [varchar](40) NULL,
	[fecha_alta] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Venta].[Cliente]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Venta].[Cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[cuit] [varchar](20) NOT NULL,
	[razon_social] [varchar](60) NULL,
	[domicilio] [varchar](60) NULL,
	[telefono] [varchar](20) NULL,
	[dni] [varchar](20) NULL,
	[mail] [varchar](20) NULL,
	[fecha_alta] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[cuit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Venta].[Envio]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Venta].[Envio](
	[id_envio] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_envio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Venta].[Orden_Venta]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Venta].[Orden_Venta](
	[id_orden_venta] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [smalldatetime] NULL,
	[monto_total] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_orden_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Venta].[Remito]    Script Date: 28/8/2023 11:09:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Venta].[Remito](
	[id_remito] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_remito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Compra].[Certificado_COA] ON 

INSERT [Compra].[Certificado_COA] ([id_certificado_coa], [certificado_coa], [fecha_certificado_coa], [id_ocompra_producto]) VALUES (1, N'MANUCHAR - ACIDO CITRICO GUOXIN - CoA.pdf', CAST(N'2023-08-28T15:18:00' AS SmallDateTime), 1)
INSERT [Compra].[Certificado_COA] ([id_certificado_coa], [certificado_coa], [fecha_certificado_coa], [id_ocompra_producto]) VALUES (2, N'LIBRE CIRCULACION.pdf', CAST(N'2023-08-28T17:16:00' AS SmallDateTime), 2)
INSERT [Compra].[Certificado_COA] ([id_certificado_coa], [certificado_coa], [fecha_certificado_coa], [id_ocompra_producto]) VALUES (3, N'MANUCHAR - ACIDO CITRICO GUOXIN - CoA.pdf', CAST(N'2023-08-28T20:53:00' AS SmallDateTime), 3)
INSERT [Compra].[Certificado_COA] ([id_certificado_coa], [certificado_coa], [fecha_certificado_coa], [id_ocompra_producto]) VALUES (4, N'MANUCHAR - ACIDO CITRICO GUOXIN - CoA.pdf', CAST(N'2023-08-28T20:53:00' AS SmallDateTime), 4)
SET IDENTITY_INSERT [Compra].[Certificado_COA] OFF
GO
SET IDENTITY_INSERT [Compra].[Lote] ON 

INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento]) VALUES (1, N'AB00100001', N'CIT005', CAST(N'2023-08-28T00:00:00' AS SmallDateTime), CAST(N'2024-08-28T00:00:00' AS SmallDateTime))
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento]) VALUES (2, N'AB00100002', N'CIT005', CAST(N'2023-08-28T00:00:00' AS SmallDateTime), CAST(N'2024-08-28T00:00:00' AS SmallDateTime))
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento]) VALUES (3, N'AB00100003', N'CIT005', CAST(N'2023-08-28T00:00:00' AS SmallDateTime), CAST(N'2024-08-28T00:00:00' AS SmallDateTime))
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento]) VALUES (4, N'ABC003001', N'FOS001', CAST(N'2023-08-28T00:00:00' AS SmallDateTime), CAST(N'2024-08-28T00:00:00' AS SmallDateTime))
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento]) VALUES (5, N'ABC003002', N'FOS001', CAST(N'2023-08-28T00:00:00' AS SmallDateTime), CAST(N'2024-08-28T00:00:00' AS SmallDateTime))
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento]) VALUES (6, N'ABC003003', N'FOS001', CAST(N'2023-08-28T00:00:00' AS SmallDateTime), CAST(N'2024-08-28T00:00:00' AS SmallDateTime))
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento]) VALUES (7, N'ABC003004', N'FOS001', CAST(N'2023-08-28T00:00:00' AS SmallDateTime), CAST(N'2024-08-28T00:00:00' AS SmallDateTime))
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento]) VALUES (8, N'ABC003005', N'FOS001', CAST(N'2023-08-28T00:00:00' AS SmallDateTime), CAST(N'2024-08-28T00:00:00' AS SmallDateTime))
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento]) VALUES (9, N'20230828001001', N'CIT005', CAST(N'2023-08-28T00:00:00' AS SmallDateTime), CAST(N'2024-08-28T00:00:00' AS SmallDateTime))
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento]) VALUES (10, N'20230828001002', N'CIT005', CAST(N'2023-08-28T00:00:00' AS SmallDateTime), CAST(N'2024-08-28T00:00:00' AS SmallDateTime))
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento]) VALUES (11, N'20230828001003', N'FOS001', CAST(N'2023-08-28T00:00:00' AS SmallDateTime), CAST(N'2024-08-28T00:00:00' AS SmallDateTime))
INSERT [Compra].[Lote] ([id_batch], [codigo_lote], [codigo_producto], [fecha_elaboracion], [fecha_vencimiento]) VALUES (12, N'20230828001004', N'FOS001', CAST(N'2023-08-28T00:00:00' AS SmallDateTime), CAST(N'2024-08-28T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [Compra].[Lote] OFF
GO
SET IDENTITY_INSERT [Compra].[OC_Insumo_Header] ON 

INSERT [Compra].[OC_Insumo_Header] ([id_oc_insumo_header], [fecha]) VALUES (1, CAST(N'2023-02-13' AS Date))
SET IDENTITY_INSERT [Compra].[OC_Insumo_Header] OFF
GO
SET IDENTITY_INSERT [Compra].[Orden_Compra] ON 

INSERT [Compra].[Orden_Compra] ([id_orden_compra], [fecha], [codigo_importacion], [certificado_libre circulacion], [fecha_libre_circulacion]) VALUES (1, CAST(N'2023-08-28T15:16:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [Compra].[Orden_Compra] ([id_orden_compra], [fecha], [codigo_importacion], [certificado_libre circulacion], [fecha_libre_circulacion]) VALUES (2, CAST(N'2023-08-28T17:12:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [Compra].[Orden_Compra] ([id_orden_compra], [fecha], [codigo_importacion], [certificado_libre circulacion], [fecha_libre_circulacion]) VALUES (3, CAST(N'2023-08-28T17:13:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [Compra].[Orden_Compra] ([id_orden_compra], [fecha], [codigo_importacion], [certificado_libre circulacion], [fecha_libre_circulacion]) VALUES (4, CAST(N'2023-08-28T19:40:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [Compra].[Orden_Compra] ([id_orden_compra], [fecha], [codigo_importacion], [certificado_libre circulacion], [fecha_libre_circulacion]) VALUES (5, CAST(N'2023-08-28T19:42:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [Compra].[Orden_Compra] ([id_orden_compra], [fecha], [codigo_importacion], [certificado_libre circulacion], [fecha_libre_circulacion]) VALUES (6, CAST(N'2023-08-28T20:25:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [Compra].[Orden_Compra] ([id_orden_compra], [fecha], [codigo_importacion], [certificado_libre circulacion], [fecha_libre_circulacion]) VALUES (7, CAST(N'2023-08-28T21:00:00' AS SmallDateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [Compra].[Orden_Compra] OFF
GO
SET IDENTITY_INSERT [Compra].[orden_compra_insumo] ON 

INSERT [Compra].[orden_compra_insumo] ([id_ocompra_insumo], [marca], [monto], [cantidad], [id_oc_insumo_header], [id_stock_insumo]) VALUES (1, N'PAPELERA PIRULO', 100, 100, 1, 1)
SET IDENTITY_INSERT [Compra].[orden_compra_insumo] OFF
GO
SET IDENTITY_INSERT [Compra].[Orden_Compra_Producto] ON 

INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto], [derecho_importacion]) VALUES (1, 1, N'CIT005', N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', 15000, 12, 14400)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto], [derecho_importacion]) VALUES (2, 3, N'FOS001', N'DANKAN SRL', 25000, 12, 30000)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto], [derecho_importacion]) VALUES (3, 6, N'CIT005', N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', 12000, 25, 24000)
INSERT [Compra].[Orden_Compra_Producto] ([id_ocompra_producto], [id_orden_compra], [codigo_producto], [marca], [cantidad], [monto], [derecho_importacion]) VALUES (4, 6, N'FOS001', N'DANKAN SRL', 15000, 12, 18000)
SET IDENTITY_INSERT [Compra].[Orden_Compra_Producto] OFF
GO
SET IDENTITY_INSERT [Compra].[Proveedor] ON 

INSERT [Compra].[Proveedor] ([id_proveedor], [razon_social], [domicilio], [telefono], [fax], [mail]) VALUES (1, N'CORBION PRODUTOS RENOVAVEIS LTDA', N'AV. RAUL BARBOSA 521', N'551155093062', N'SIN DATOS', N'SIN DATOS')
INSERT [Compra].[Proveedor] ([id_proveedor], [razon_social], [domicilio], [telefono], [fax], [mail]) VALUES (2, N'MASTELLONE HERMANOS SA', N'ALMIRANTE BROWN 957', N'02374859000', N'02374859000', N'mastellone@mastellone.com.ar')
INSERT [Compra].[Proveedor] ([id_proveedor], [razon_social], [domicilio], [telefono], [fax], [mail]) VALUES (3, N'GOOD FOOD SA', N'TRES ARROYOS 329', N'46275325', N'46275325', N'goodfood@goodfood.com.ar')
SET IDENTITY_INSERT [Compra].[Proveedor] OFF
GO
SET IDENTITY_INSERT [Costo].[Concepto_Header] ON 

INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (1, N'EXWORK', N'El costo se limita a la producción y entrega en el lugar de origen', 340, 1, 3)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (2, N'FOB', N'El costo incluye la entrega en el puerto de origen', 340, 1, 3)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (3, N'CFR', N'El costo incluye el transporte marítimo y seguro hasta el puerto de destino', 340, 1, 3)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (4, N'CIF', N'el costo incluye el transporte marítimo y seguro hasta el puerto de destino y los costos de llegada y procesamiento en el puerto de destino', 340, 1, 3)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (5, N'VAE', N'Tasa estadística, también conocida como Valor en Aduana Estadístico', 340, 2, 4)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (6, N'IVA', N'Impuesto al valor agregado', 340, 2, 2)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (7, N'IVA AD', N'Impuesto al valor agregado Adicional', 340, 2, 2)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (8, N'GAN', N'Ganancias', 340, 2, 2)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (9, N'IBC', N'Ingresos Brutos', 340, 2, 2)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (10, N'SIM', N'Arancel a pagar por despacho', 340, 1, 4)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (11, N'INAL', N'verificacondiciones higiénico-sanitarias, bromatológicas y de identificación comercial de los productos', 340, 1, 4)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (12, N'SENASA', N'Arancel SENASA', 340, 1, 4)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (13, N'NAVIERA', N'Costos de Naviera', 340, 1, 5)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (14, N'TERMINAL', N'Costos de Terminal', 340, 1, 5)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (15, N'FLETE', N'Transporte interno', 340, 1, 5)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (16, N'FLETE USD', N'Transporte en país de origen', 407, 1, 5)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (17, N'HON', N'Honorarios del despachante de Aduana', 340, 1, 5)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (18, N'COM', N'Comisiones bancarias', 340, 1, 5)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (19, N'EXTRAS', N'Gastos varios', 340, 1, 5)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (20, N'SEGURO USD', N'Seguro contratado en origen', 407, 1, 5)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (21, N'AJUSTE USD', N'Ajustes', NULL, 1, 5)
INSERT [Costo].[Concepto_Header] ([id_concepto_header], [nombre], [descripcion], [id_pais_origen], [id_tipo_valor], [id_tipo_concepto]) VALUES (22, N'DIMP', N'Derecho de Importacion gravamen Ad Valorem sobre el producto a importar', 340, 2, 2)
SET IDENTITY_INSERT [Costo].[Concepto_Header] OFF
GO
SET IDENTITY_INSERT [Costo].[Perfil_Costo] ON 

INSERT [Costo].[Perfil_Costo] ([id_perfil_costo], [nombre], [descripcion], [fecha_creacion], [fecha_baja], [vigente]) VALUES (1, N'CIF ARGENTINO 23', N'CIF + NACIONALIZACION', CAST(N'2023-07-05T19:35:00' AS SmallDateTime), NULL, 1)
INSERT [Costo].[Perfil_Costo] ([id_perfil_costo], [nombre], [descripcion], [fecha_creacion], [fecha_baja], [vigente]) VALUES (2, N'CIF 2', N'NUEVO CIF CON NACIONALIZACION AGOSTO 23', CAST(N'2023-08-28T20:28:00' AS SmallDateTime), NULL, 1)
SET IDENTITY_INSERT [Costo].[Perfil_Costo] OFF
GO
SET IDENTITY_INSERT [Costo].[Secuencia_Perfil] ON 

INSERT [Costo].[Secuencia_Perfil] ([id_secuencia_perfil], [id_perfil_costo], [orden]) VALUES (1, 1, 1)
INSERT [Costo].[Secuencia_Perfil] ([id_secuencia_perfil], [id_perfil_costo], [orden]) VALUES (2, 2, 1)
SET IDENTITY_INSERT [Costo].[Secuencia_Perfil] OFF
GO
SET IDENTITY_INSERT [Costo].[Tasa_Concepto] ON 

INSERT [Costo].[Tasa_Concepto] ([id_tasa_concepto], [valor], [id_concepto_header]) VALUES (1, 3, 5)
INSERT [Costo].[Tasa_Concepto] ([id_tasa_concepto], [valor], [id_concepto_header]) VALUES (2, 21, 6)
INSERT [Costo].[Tasa_Concepto] ([id_tasa_concepto], [valor], [id_concepto_header]) VALUES (3, 20, 7)
INSERT [Costo].[Tasa_Concepto] ([id_tasa_concepto], [valor], [id_concepto_header]) VALUES (4, 6, 8)
INSERT [Costo].[Tasa_Concepto] ([id_tasa_concepto], [valor], [id_concepto_header]) VALUES (5, 1.8, 9)
INSERT [Costo].[Tasa_Concepto] ([id_tasa_concepto], [valor], [id_concepto_header]) VALUES (6, 10, 10)
SET IDENTITY_INSERT [Costo].[Tasa_Concepto] OFF
GO
SET IDENTITY_INSERT [Costo].[Tipo_Concepto] ON 

INSERT [Costo].[Tipo_Concepto] ([id_tipo_concepto], [descripcion]) VALUES (1, N'D.importacion')
INSERT [Costo].[Tipo_Concepto] ([id_tipo_concepto], [descripcion]) VALUES (2, N'Impuesto')
INSERT [Costo].[Tipo_Concepto] ([id_tipo_concepto], [descripcion]) VALUES (3, N'Costo')
INSERT [Costo].[Tipo_Concepto] ([id_tipo_concepto], [descripcion]) VALUES (4, N'Arancel')
INSERT [Costo].[Tipo_Concepto] ([id_tipo_concepto], [descripcion]) VALUES (5, N'Extras')
SET IDENTITY_INSERT [Costo].[Tipo_Concepto] OFF
GO
SET IDENTITY_INSERT [Costo].[Tipo_Valor] ON 

INSERT [Costo].[Tipo_Valor] ([id_tipo_concepto], [descripcion]) VALUES (1, N'Nominal')
INSERT [Costo].[Tipo_Valor] ([id_tipo_concepto], [descripcion]) VALUES (2, N'Porcentual')
SET IDENTITY_INSERT [Costo].[Tipo_Valor] OFF
GO
SET IDENTITY_INSERT [Parametro].[Certificado] ON 

INSERT [Parametro].[Certificado] ([id_certificado], [nombre]) VALUES (1, N'MSDS')
INSERT [Parametro].[Certificado] ([id_certificado], [nombre]) VALUES (2, N'LIBRE CIRCULACION')
INSERT [Parametro].[Certificado] ([id_certificado], [nombre]) VALUES (3, N'RNPA')
INSERT [Parametro].[Certificado] ([id_certificado], [nombre]) VALUES (4, N'COA')
SET IDENTITY_INSERT [Parametro].[Certificado] OFF
GO
SET IDENTITY_INSERT [Parametro].[Compra] ON 

INSERT [Parametro].[Compra] ([id_parametro], [descripcion], [valor]) VALUES (1, N'Valor de Sistema.Estado por el cual se impacta en Produccion.Stock una OC', 4)
SET IDENTITY_INSERT [Parametro].[Compra] OFF
GO
SET IDENTITY_INSERT [Parametro].[Ruta] ON 

INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta], [id_certificado]) VALUES (1, N'RUTA SUBIDA MSDS', N'D:\CONSULTORA PAL\BLV\MSDS', 1)
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta], [id_certificado]) VALUES (2, N'RUTA REPOSITORIO MSDS', N'D:\CONSULTORA PAL\BLV\MSDS_REPO', 1)
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta], [id_certificado]) VALUES (3, N'RUTA BACKUP MSDS', N'D:\CONSULTORA PAL\BLV\MSDS_BACKUP', 1)
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta], [id_certificado]) VALUES (4, N'RUTA SUBIDA LIBRE CIRCULACION', N'D:\CONSULTORA PAL\BLV\LIBRE_CIRCULACION', 2)
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta], [id_certificado]) VALUES (5, N'RUTA REPOSITORIO LIBRE CIRCULACION', N'D:\CONSULTORA PAL\BLV\LIBRE_CIRCULACION_REPO', 2)
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta], [id_certificado]) VALUES (6, N'RUTA BACKUP LIBRE CIRCULACION', N'D:\CONSULTORA PAL\BLV\LIBRE_CIRCULACION_BACKUP', 2)
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta], [id_certificado]) VALUES (7, N'RUTA SUBIDA RNPA', N'D:\CONSULTORA PAL\BLV\RNPA', 3)
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta], [id_certificado]) VALUES (8, N'RUTA REPOSITORIO RNPA', N'D:\CONSULTORA PAL\BLV\RNPA_REPO', 3)
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta], [id_certificado]) VALUES (9, N'RUTA BACKUP RNPA', N'D:\CONSULTORA PAL\BLV\RNPA_BACKUP', 3)
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta], [id_certificado]) VALUES (10, N'RUTA SUBIDA COA', N'D:\CONSULTORA PAL\BLV\COA', 3)
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta], [id_certificado]) VALUES (11, N'RUTA REPOSITORIO COA', N'D:\CONSULTORA PAL\BLV\COA_REPO', 3)
INSERT [Parametro].[Ruta] ([id_ruta], [descripcion], [ruta], [id_certificado]) VALUES (12, N'RUTA BACKUP COA', N'D:\CONSULTORA PAL\BLV\COA_BACKUP', 3)
SET IDENTITY_INSERT [Parametro].[Ruta] OFF
GO
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (1, 1, 2, 1, 1500)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (1, 2, 16, 1, 150)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (1, 3, 20, 1, 100)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (1, 4, 21, 1, -558)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (1, 6, 5, 2, 3)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (1, 7, 6, 2, 21)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (1, 8, 7, 2, 20)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (1, 9, 10, 1, 10)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (1, 5, 22, 1, 14400)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (3, 1, 2, 1, 15000)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (3, 2, 16, 1, 120)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (3, 3, 20, 1, 122)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (3, 4, 21, 1, -560)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (3, 6, 5, 2, 3)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (3, 7, 6, 2, 21)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (3, 8, 7, 2, 20)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (3, 9, 10, 1, 10)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (3, 5, 22, 1, 30000)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (6, 5, 22, 1, 42000)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (6, 1, 2, 1, 1500)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (6, 2, 16, 1, 150)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (6, 4, 21, 1, -500)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (6, 3, 20, 1, 100)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (6, 7, 6, 2, 21)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (6, 8, 7, 2, 20)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (6, 16, 9, 2, 1.8)
INSERT [Proceso].[Costo_a_Calcular] ([id_orden_compra], [orden], [id_concepto_header], [id_tipo_valor], [valor]) VALUES (6, 17, 12, 1, 10)
GO
SET IDENTITY_INSERT [Proceso].[Estado] ON 

INSERT [Proceso].[Estado] ([id_estado], [descripcion]) VALUES (0, N'Hoja Fab. Abierta')
INSERT [Proceso].[Estado] ([id_estado], [descripcion]) VALUES (1, N'Solicitado')
INSERT [Proceso].[Estado] ([id_estado], [descripcion]) VALUES (2, N'En Proceso')
INSERT [Proceso].[Estado] ([id_estado], [descripcion]) VALUES (3, N'Finalizado')
INSERT [Proceso].[Estado] ([id_estado], [descripcion]) VALUES (4, N'En Stock')
SET IDENTITY_INSERT [Proceso].[Estado] OFF
GO
SET IDENTITY_INSERT [Proceso].[Tablon_Impacto_Stock] ON 

INSERT [Proceso].[Tablon_Impacto_Stock] ([id_tablon_impacto_stock], [id_compra], [id_ocompra_producto], [numero_importacion], [certificado_libre_circulacion], [fecha_certificado_libre_circulacion], [id_lote], [codigo_producto], [marca], [cantidad], [certificado_coa], [fecha_elaboracion], [fecha_vencimiento], [posiciones_deposito]) VALUES (4, 1, 1, N'ABC002', N'LIBRE CIRCULACION.pdf', CAST(N'2023-08-28' AS Date), 1, N'CIT005', N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', NULL, N'MANUCHAR - ACIDO CITRICO GUOXIN - CoA.pdf', CAST(N'2023-08-28T00:00:00' AS SmallDateTime), CAST(N'2024-08-28T00:00:00' AS SmallDateTime), NULL)
INSERT [Proceso].[Tablon_Impacto_Stock] ([id_tablon_impacto_stock], [id_compra], [id_ocompra_producto], [numero_importacion], [certificado_libre_circulacion], [fecha_certificado_libre_circulacion], [id_lote], [codigo_producto], [marca], [cantidad], [certificado_coa], [fecha_elaboracion], [fecha_vencimiento], [posiciones_deposito]) VALUES (5, 1, 1, N'ABC002', N'LIBRE CIRCULACION.pdf', CAST(N'2023-08-28' AS Date), 2, N'CIT005', N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', NULL, N'MANUCHAR - ACIDO CITRICO GUOXIN - CoA.pdf', CAST(N'2023-08-28T00:00:00' AS SmallDateTime), CAST(N'2024-08-28T00:00:00' AS SmallDateTime), NULL)
INSERT [Proceso].[Tablon_Impacto_Stock] ([id_tablon_impacto_stock], [id_compra], [id_ocompra_producto], [numero_importacion], [certificado_libre_circulacion], [fecha_certificado_libre_circulacion], [id_lote], [codigo_producto], [marca], [cantidad], [certificado_coa], [fecha_elaboracion], [fecha_vencimiento], [posiciones_deposito]) VALUES (6, 1, 1, N'ABC002', N'LIBRE CIRCULACION.pdf', CAST(N'2023-08-28' AS Date), 3, N'CIT005', N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', NULL, N'MANUCHAR - ACIDO CITRICO GUOXIN - CoA.pdf', CAST(N'2023-08-28T00:00:00' AS SmallDateTime), CAST(N'2024-08-28T00:00:00' AS SmallDateTime), NULL)
INSERT [Proceso].[Tablon_Impacto_Stock] ([id_tablon_impacto_stock], [id_compra], [id_ocompra_producto], [numero_importacion], [certificado_libre_circulacion], [fecha_certificado_libre_circulacion], [id_lote], [codigo_producto], [marca], [cantidad], [certificado_coa], [fecha_elaboracion], [fecha_vencimiento], [posiciones_deposito]) VALUES (7, 1, 1, N'ABC002', N'LIBRE CIRCULACION.pdf', CAST(N'2023-08-28' AS Date), 4, N'CIT005', N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', NULL, N'MANUCHAR - ACIDO CITRICO GUOXIN - CoA.pdf', CAST(N'2023-08-28T00:00:00' AS SmallDateTime), CAST(N'2024-08-28T00:00:00' AS SmallDateTime), NULL)
SET IDENTITY_INSERT [Proceso].[Tablon_Impacto_Stock] OFF
GO
SET IDENTITY_INSERT [Produccion].[Capacidad_Envase] ON 

INSERT [Produccion].[Capacidad_Envase] ([id_capacidad_envase], [id_empaque], [capacidad]) VALUES (1, 1, 25)
INSERT [Produccion].[Capacidad_Envase] ([id_capacidad_envase], [id_empaque], [capacidad]) VALUES (2, 2, 50)
INSERT [Produccion].[Capacidad_Envase] ([id_capacidad_envase], [id_empaque], [capacidad]) VALUES (3, 3, 50)
INSERT [Produccion].[Capacidad_Envase] ([id_capacidad_envase], [id_empaque], [capacidad]) VALUES (4, 4, 50)
INSERT [Produccion].[Capacidad_Envase] ([id_capacidad_envase], [id_empaque], [capacidad]) VALUES (5, 5, 50)
INSERT [Produccion].[Capacidad_Envase] ([id_capacidad_envase], [id_empaque], [capacidad]) VALUES (6, 6, 25)
INSERT [Produccion].[Capacidad_Envase] ([id_capacidad_envase], [id_empaque], [capacidad]) VALUES (7, 1, 50)
INSERT [Produccion].[Capacidad_Envase] ([id_capacidad_envase], [id_empaque], [capacidad]) VALUES (8, 7, 25)
SET IDENTITY_INSERT [Produccion].[Capacidad_Envase] OFF
GO
SET IDENTITY_INSERT [Produccion].[Empaque] ON 

INSERT [Produccion].[Empaque] ([id_empaque], [descripcion], [id_medida_envase]) VALUES (1, N'BOLSA PAPEL BLANCA', 1)
INSERT [Produccion].[Empaque] ([id_empaque], [descripcion], [id_medida_envase]) VALUES (2, N'BIDON', 1)
INSERT [Produccion].[Empaque] ([id_empaque], [descripcion], [id_medida_envase]) VALUES (3, N'CAJA', 1)
INSERT [Produccion].[Empaque] ([id_empaque], [descripcion], [id_medida_envase]) VALUES (4, N'IBC', 1)
INSERT [Produccion].[Empaque] ([id_empaque], [descripcion], [id_medida_envase]) VALUES (5, N'DRUM', 1)
INSERT [Produccion].[Empaque] ([id_empaque], [descripcion], [id_medida_envase]) VALUES (6, N'TAMBOR', 1)
INSERT [Produccion].[Empaque] ([id_empaque], [descripcion], [id_medida_envase]) VALUES (7, N'BOLSA POLIETILENO', 1)
SET IDENTITY_INSERT [Produccion].[Empaque] OFF
GO
SET IDENTITY_INSERT [Produccion].[Medida] ON 

INSERT [Produccion].[Medida] ([id_medida], [descripcion], [unidad]) VALUES (1, N'KILOGRAMOS', N'KG')
SET IDENTITY_INSERT [Produccion].[Medida] OFF
GO
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'3085', N'SUCRALOSA')
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'BOL025', N'BOLSA PAPEL BLANCA 25KG')
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'CIT005', N'CITRATO DE SODIO')
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'FAB042', N'INTEGRAL CARNICO')
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'FOS001', N'TRIFOSFATO DE SODIO')
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'OLI001', N'ACEITE DE OLIVA EXTRA VIRGEN')
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'OLIVA001', N'ACEITE OLIVA')
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'PRC001', N'PURAC FCC 98')
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'PRO001', N'PROPIONATO DE CALCIO')
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'QUES042', N'INTEGRAL QUESO')
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'XAN001', N'GOMA XANTICA')
INSERT [Produccion].[Producto_Header] ([codigo_producto], [nombre_producto]) VALUES (N'XAN002', N'GOMA XANTICA')
GO
SET IDENTITY_INSERT [Produccion].[Producto_Marca] ON 

INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS], [RNPA]) VALUES (1, N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', N'CIT005', 407, N'DATA FIBRA DE CELULOSA - ALBAFIBRE C100.pdf', N'RNPA ACIDO CITRICO RZBC.pdf')
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS], [RNPA]) VALUES (2, N'SHANGHAI TIANJIA BIOCHEMICAL CO., LTD.', N'PRC001', 407, N'ejercicio de trazabilidad_librecircu_3paginasprimeras.pdf', N'MANUCHAR - CITRICO GUOXIN - RNPA.pdf')
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS], [RNPA]) VALUES (3, N'DANKAN SRL', N'FOS001', 340, N'ejercicio de trazabilidad_librecircu_3paginasprimeras.pdf', N'MANUCHAR - CITRICO GUOXIN - RNPA.pdf')
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS], [RNPA]) VALUES (5, N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', N'PRO001', 407, NULL, NULL)
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS], [RNPA]) VALUES (6, N'SHANGHAI TIANJIA BIOCHEMICAL CO., LTD.', N'PRO001', 407, N'DATA FIBRA DE CELULOSA - ALBAFIBRE C100.pdf', N'MANUCHAR - CITRICO GUOXIN - RNPA.pdf')
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS], [RNPA]) VALUES (7, N'LASERENISIMA', N'CIT005', 340, N'DATA FIBRA DE CELULOSA - ALBAFIBRE C100.pdf', N'MANUCHAR - CITRICO GUOXIN - RNPA.pdf')
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS], [RNPA]) VALUES (1006, N'DANKAN SRL', N'OLI001', 111, N'DATA FIBRA DE CELULOSA - ALBAFIBRE C100.pdf', N'RNPA ACIDO CITRICO RZBC.pdf')
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS], [RNPA]) VALUES (1007, N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', N'3085', 407, N'DATA FIBRA DE CELULOSA - ALBAFIBRE C100.pdf', N'MANUCHAR - CITRICO GUOXIN - RNPA.pdf')
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS], [RNPA]) VALUES (2006, N'DANKAN SRL', N'OLIVA001', 340, N'DATA FIBRA DE CELULOSA - ALBAFIBRE C100.pdf', N'RNPA ACIDO CITRICO RZBC.pdf')
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS], [RNPA]) VALUES (2007, N'QINGDAO TWELL SANSINO IMPORT & EXPORT CO', N'XAN001', 407, N'DATA FIBRA DE CELULOSA - ALBAFIBRE C100.pdf', N'RNPA ACIDO CITRICO RZBC.pdf')
INSERT [Produccion].[Producto_Marca] ([id_marca], [marca], [codigo_producto], [id_pais], [MSDS], [RNPA]) VALUES (2008, N'SHANGHAI TIANJIA BIOCHEMICAL CO., LTD.', N'XAN002', 407, N'DATA FIBRA DE CELULOSA - ALBAFIBRE C100.pdf', N'RNPA ACIDO CITRICO RZBC.pdf')
SET IDENTITY_INSERT [Produccion].[Producto_Marca] OFF
GO
SET IDENTITY_INSERT [Produccion].[Receta] ON 

INSERT [Produccion].[Receta] ([id_receta], [nombre_receta], [codigo_producto]) VALUES (1, N'INTEGRAL CARNICO ESTANDAR', N'FAB042')
SET IDENTITY_INSERT [Produccion].[Receta] OFF
GO
SET IDENTITY_INSERT [Produccion].[Stock] ON 

INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (1, 1, 1, 1, 1, NULL, 0, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (2, 1, 1, 1, 2, NULL, 0, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (3, 1, 1, 1, 3, NULL, 0, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (4, 1, 1, 1, 4, NULL, 0, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (5, 1, 1, 1, 5, NULL, 0, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (6, 1, 1, 2, 1, NULL, 0, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (7, 1, 1, 2, 2, NULL, 0, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (8, 1, 1, 2, 3, NULL, 0, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (9, 1, 1, 2, 4, NULL, 1, 1)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (10, 1, 1, 2, 5, NULL, 1, 1)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (11, 1, 1, 1, 1, NULL, 0, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (12, 1, 1, 1, 2, NULL, 0, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (13, 1, 1, 1, 3, NULL, 0, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (14, 2, 1, 1, 2, NULL, 0, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (15, 2, 1, 1, 3, NULL, 0, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (16, 2, 1, 1, 4, NULL, 0, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (17, 2, 1, 1, 5, NULL, 0, 0)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (18, 2, 1, 2, 1, NULL, 1, 1)
INSERT [Produccion].[Stock] ([id_stock], [piso], [posicion], [altura], [fila], [codigo_barra], [disponible], [cuarentena]) VALUES (19, 2, 1, 2, 2, NULL, 1, 1)
SET IDENTITY_INSERT [Produccion].[Stock] OFF
GO
SET IDENTITY_INSERT [Produccion].[Stock_Insumo] ON 

INSERT [Produccion].[Stock_Insumo] ([id_stock_insumo], [id_empaque], [id_medida], [cantidad], [id_capacidad], [marca]) VALUES (1, 1, 1, 72, 1, N'PAPELERA PIRULO')
INSERT [Produccion].[Stock_Insumo] ([id_stock_insumo], [id_empaque], [id_medida], [cantidad], [id_capacidad], [marca]) VALUES (2, 1, 1, 200, 1, N'PAPELERA EL PAPELON')
SET IDENTITY_INSERT [Produccion].[Stock_Insumo] OFF
GO
SET IDENTITY_INSERT [Relacion].[Cliente_ciudad] ON 

INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (1, 1, 2504)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (2, 2, 2504)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (3, 3, 2504)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (4, 4, 2504)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (5, 5, 2504)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (6, 6, 2504)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (7, 7, 2504)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (8, 8, 2504)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (9, 32, 2504)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (10, 37, 2504)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (11, 38, 2504)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (12, 39, 2504)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (13, 40, 2504)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (14, 41, 2504)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (15, 42, 2504)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (16, 43, 2504)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (17, 44, 2504)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (18, 81, 2504)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (19, 86, 2504)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (20, 15, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (21, 16, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (22, 17, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (23, 18, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (24, 19, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (25, 20, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (26, 21, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (27, 22, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (28, 23, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (29, 24, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (30, 25, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (31, 26, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (32, 36, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (33, 57, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (34, 58, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (35, 59, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (36, 60, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (37, 61, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (38, 62, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (39, 63, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (40, 64, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (41, 65, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (42, 66, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (43, 67, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (44, 68, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (45, 69, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (46, 70, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (47, 71, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (48, 83, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (49, 84, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (50, 27, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (51, 28, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (52, 29, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (53, 30, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (54, 34, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (55, 35, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (56, 72, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (57, 73, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (58, 74, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (59, 75, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (60, 76, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (61, 77, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (62, 78, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (63, 90, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (64, 91, 2507)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (65, 11, 2469)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (66, 34, 2469)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (67, 35, 2469)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (68, 50, 2469)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (69, 71, 2469)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (70, 88, 2469)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (71, 90, 2469)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (72, 91, 2469)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (73, 9, 2479)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (74, 10, 2479)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (75, 12, 2479)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (76, 13, 2479)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (77, 14, 2479)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (78, 31, 2479)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (79, 33, 2479)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (80, 45, 2479)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (81, 46, 2479)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (82, 47, 2479)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (83, 48, 2479)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (84, 49, 2479)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (85, 51, 2479)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (86, 52, 2479)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (87, 53, 2479)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (88, 54, 2479)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (89, 55, 2479)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (90, 56, 2479)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (91, 79, 2479)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (92, 80, 2479)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (93, 82, 2479)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (94, 85, 2479)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (95, 87, 2479)
INSERT [Relacion].[Cliente_ciudad] ([id_cliente_ciudad], [id_cliente], [id_ciudad]) VALUES (96, 89, 2479)
SET IDENTITY_INSERT [Relacion].[Cliente_ciudad] OFF
GO
SET IDENTITY_INSERT [Relacion].[Compra_Estado] ON 

INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (1, 1, 0, CAST(N'2023-08-28T15:16:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (2, 1, 4, CAST(N'2023-08-28T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (3, 2, 0, CAST(N'2023-08-28T17:12:00' AS SmallDateTime), 1)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (4, 3, 0, CAST(N'2023-08-28T17:13:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (5, 1, 4, CAST(N'2023-08-28T00:00:00' AS SmallDateTime), 1)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (6, 3, 4, CAST(N'2023-08-28T00:00:00' AS SmallDateTime), 1)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (7, 4, 0, CAST(N'2023-08-28T19:40:00' AS SmallDateTime), 1)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (8, 5, 0, CAST(N'2023-08-28T19:42:00' AS SmallDateTime), 1)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (9, 6, 0, CAST(N'2023-08-28T20:25:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (10, 6, 2, CAST(N'2023-08-28T00:00:00' AS SmallDateTime), 0)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (11, 6, 4, CAST(N'2023-08-30T00:00:00' AS SmallDateTime), 1)
INSERT [Relacion].[Compra_Estado] ([id_compra_estado], [id_compra], [id_estado], [fecha], [vigente]) VALUES (12, 7, 0, CAST(N'2023-08-28T21:00:00' AS SmallDateTime), 1)
SET IDENTITY_INSERT [Relacion].[Compra_Estado] OFF
GO
SET IDENTITY_INSERT [Relacion].[Costo_oc] ON 

INSERT [Relacion].[Costo_oc] ([id_costo_oc], [id_concepto], [id_orden_compra], [monto]) VALUES (1, 4, 1, 23328.77152)
INSERT [Relacion].[Costo_oc] ([id_costo_oc], [id_concepto], [id_orden_compra], [monto]) VALUES (2, 4, 2, NULL)
INSERT [Relacion].[Costo_oc] ([id_costo_oc], [id_concepto], [id_orden_compra], [monto]) VALUES (3, 4, 3, 134834.83853752638)
INSERT [Relacion].[Costo_oc] ([id_costo_oc], [id_concepto], [id_orden_compra], [monto]) VALUES (4, 1, 4, NULL)
INSERT [Relacion].[Costo_oc] ([id_costo_oc], [id_concepto], [id_orden_compra], [monto]) VALUES (5, 4, 5, NULL)
INSERT [Relacion].[Costo_oc] ([id_costo_oc], [id_concepto], [id_orden_compra], [monto]) VALUES (6, 4, 6, 342295.85658653011)
INSERT [Relacion].[Costo_oc] ([id_costo_oc], [id_concepto], [id_orden_compra], [monto]) VALUES (7, 4, 7, NULL)
SET IDENTITY_INSERT [Relacion].[Costo_oc] OFF
GO
SET IDENTITY_INSERT [Relacion].[Deposito_Ciudad] ON 

INSERT [Relacion].[Deposito_Ciudad] ([id_deposito_ciudad], [id_deposito], [id_ciudad]) VALUES (1, 1, 2473)
INSERT [Relacion].[Deposito_Ciudad] ([id_deposito_ciudad], [id_deposito], [id_ciudad]) VALUES (2, 2, 2477)
SET IDENTITY_INSERT [Relacion].[Deposito_Ciudad] OFF
GO
SET IDENTITY_INSERT [Relacion].[Deposito_Stock] ON 

INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (1, 1, 1)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (2, 1, 2)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (3, 1, 3)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (4, 1, 4)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (5, 1, 5)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (6, 1, 6)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (7, 1, 7)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (8, 1, 8)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (9, 1, 9)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (10, 1, 10)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (11, 2, 11)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (12, 2, 12)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (13, 2, 13)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (14, 2, 14)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (15, 2, 15)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (16, 2, 16)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (17, 2, 17)
INSERT [Relacion].[Deposito_Stock] ([id_deposito_Stock], [id_deposito], [id_stock]) VALUES (18, 2, 18)
SET IDENTITY_INSERT [Relacion].[Deposito_Stock] OFF
GO
SET IDENTITY_INSERT [Relacion].[Derecho_importacion_Producto] ON 

INSERT [Relacion].[Derecho_importacion_Producto] ([id_derecho_importacion_producto], [id_concepto], [codigo_producto], [codigo_arancelario], [tasa]) VALUES (1, 22, N'CIT005', N'2918.15', 8)
INSERT [Relacion].[Derecho_importacion_Producto] ([id_derecho_importacion_producto], [id_concepto], [codigo_producto], [codigo_arancelario], [tasa]) VALUES (2, 22, N'FOS001', N'2835.31', 10)
INSERT [Relacion].[Derecho_importacion_Producto] ([id_derecho_importacion_producto], [id_concepto], [codigo_producto], [codigo_arancelario], [tasa]) VALUES (3, 22, N'PRO001', N'2915.39', 12)
INSERT [Relacion].[Derecho_importacion_Producto] ([id_derecho_importacion_producto], [id_concepto], [codigo_producto], [codigo_arancelario], [tasa]) VALUES (4, 22, N'OLI001', N'1509.10', 11)
INSERT [Relacion].[Derecho_importacion_Producto] ([id_derecho_importacion_producto], [id_concepto], [codigo_producto], [codigo_arancelario], [tasa]) VALUES (5, 22, N'3085', N'2932.19', 2)
INSERT [Relacion].[Derecho_importacion_Producto] ([id_derecho_importacion_producto], [id_concepto], [codigo_producto], [codigo_arancelario], [tasa]) VALUES (6, 22, N'OLIVA001', N'2918.15', 8)
INSERT [Relacion].[Derecho_importacion_Producto] ([id_derecho_importacion_producto], [id_concepto], [codigo_producto], [codigo_arancelario], [tasa]) VALUES (7, 22, N'XAN001', N'1111.11', 2)
INSERT [Relacion].[Derecho_importacion_Producto] ([id_derecho_importacion_producto], [id_concepto], [codigo_producto], [codigo_arancelario], [tasa]) VALUES (8, 22, N'XAN002', N'1111.11', 3)
SET IDENTITY_INSERT [Relacion].[Derecho_importacion_Producto] OFF
GO
SET IDENTITY_INSERT [Relacion].[DP_Ciudad] ON 

INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1, 74, 148)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2, 74, 149)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3, 74, 150)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (4, 74, 151)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (5, 74, 152)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (6, 74, 153)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (7, 74, 154)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (8, 74, 155)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (9, 74, 156)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (10, 74, 157)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (11, 74, 158)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (12, 74, 159)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (13, 74, 160)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (14, 74, 161)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (15, 74, 162)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (16, 74, 163)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (17, 74, 164)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (18, 74, 165)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (19, 74, 217)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (20, 74, 1080)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (21, 74, 1570)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (22, 74, 1579)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (23, 74, 1721)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (24, 74, 1750)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (25, 74, 2330)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (26, 74, 2370)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (27, 76, 73)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (28, 76, 134)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (29, 76, 188)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (30, 76, 439)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (31, 76, 497)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (32, 76, 508)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (33, 76, 535)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (34, 76, 556)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (35, 76, 682)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (36, 76, 724)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (37, 76, 929)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (38, 76, 1145)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (39, 76, 1203)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (40, 76, 1298)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (41, 76, 1306)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (42, 76, 1310)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (43, 76, 1311)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (44, 76, 1312)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (45, 76, 1313)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (46, 76, 1314)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (47, 76, 1315)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (48, 76, 1316)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (49, 76, 1317)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (50, 76, 1318)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (51, 76, 1319)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (52, 76, 1320)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (53, 76, 1321)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (54, 76, 1322)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (55, 76, 1323)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (56, 76, 1324)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (57, 76, 1325)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (58, 76, 1326)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (59, 76, 1327)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (60, 76, 1328)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (61, 76, 1329)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (62, 76, 1330)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (63, 76, 1331)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (64, 76, 1332)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (65, 76, 1333)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (66, 76, 1334)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (67, 76, 1335)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (68, 76, 1336)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (69, 76, 1337)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (70, 76, 1338)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (71, 76, 1339)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (72, 76, 1340)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (73, 76, 1341)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (74, 76, 1342)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (75, 76, 1343)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (76, 76, 1344)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (77, 76, 1345)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (78, 76, 1346)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (79, 76, 1347)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (80, 76, 1348)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (81, 76, 1349)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (82, 76, 1350)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (83, 76, 1351)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (84, 76, 1352)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (85, 76, 1353)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (86, 76, 1354)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (87, 76, 1355)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (88, 76, 1356)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (89, 76, 1357)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (90, 76, 1358)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (91, 76, 1359)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (92, 76, 1360)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (93, 76, 1361)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (94, 76, 1362)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (95, 76, 1363)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (96, 76, 1364)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (97, 76, 1365)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (98, 76, 1366)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (99, 76, 1367)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (100, 76, 1368)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (101, 76, 1369)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (102, 76, 1370)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (103, 76, 1371)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (104, 76, 1372)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (105, 76, 1373)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (106, 76, 1374)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (107, 76, 1375)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (108, 76, 1376)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (109, 76, 1377)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (110, 76, 1378)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (111, 76, 1379)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (112, 76, 1380)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (113, 76, 1381)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (114, 76, 1382)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (115, 76, 1383)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (116, 76, 1384)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (117, 76, 1385)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (118, 76, 1386)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (119, 76, 1387)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (120, 76, 1388)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (121, 76, 1389)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (122, 76, 1907)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (123, 76, 1955)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (124, 76, 1969)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (125, 76, 1986)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (126, 76, 2025)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (127, 76, 2390)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (128, 76, 2460)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (129, 76, 70)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (130, 76, 173)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (131, 76, 240)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (132, 76, 280)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (133, 76, 301)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (134, 76, 480)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (135, 76, 510)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (136, 76, 546)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (137, 76, 559)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (138, 76, 912)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (139, 76, 994)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (140, 76, 999)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (141, 76, 1095)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (142, 76, 1262)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (143, 76, 1316)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (144, 76, 1372)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (145, 76, 1819)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (146, 76, 1860)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (147, 76, 1898)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (148, 76, 1899)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (149, 76, 1942)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (150, 76, 1953)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (151, 76, 1970)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (152, 76, 2182)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (153, 76, 2267)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (154, 76, 2327)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (155, 76, 2388)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (156, 76, 2389)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (157, 76, 2390)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (158, 76, 2391)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (159, 76, 2392)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (160, 76, 2393)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (161, 76, 2394)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (162, 76, 2395)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (163, 76, 2396)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (164, 76, 2397)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (165, 76, 2398)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (166, 76, 2399)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (167, 76, 2400)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (168, 76, 2401)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (169, 76, 2402)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (170, 76, 2403)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (171, 76, 2404)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (172, 76, 2405)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (173, 76, 2406)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (174, 76, 2407)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (175, 76, 2408)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (176, 76, 2409)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (177, 76, 2410)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (178, 76, 2411)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (179, 76, 2412)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (180, 76, 2413)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (181, 76, 2414)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (182, 76, 2415)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (183, 76, 2416)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (184, 76, 2417)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (185, 76, 2418)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (186, 76, 2419)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (187, 76, 2420)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (188, 76, 2421)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (189, 76, 2422)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (190, 76, 2423)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (191, 76, 2424)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (192, 76, 2425)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (193, 76, 2426)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (194, 76, 2427)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (195, 76, 2428)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (196, 76, 2429)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (197, 76, 2430)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (198, 76, 2431)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (199, 76, 2432)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (200, 76, 2433)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (201, 76, 2434)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (202, 76, 2435)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (203, 76, 2436)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (204, 76, 2437)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (205, 76, 2438)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (206, 76, 2439)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (207, 76, 2440)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (208, 76, 2441)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (209, 76, 2442)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (210, 76, 2443)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (211, 76, 2444)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (212, 76, 2445)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (213, 76, 2446)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (214, 76, 2447)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (215, 76, 2448)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (216, 76, 2449)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (217, 76, 2450)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (218, 76, 2451)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (219, 76, 2452)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (220, 76, 2453)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (221, 76, 2454)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (222, 76, 2455)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (223, 76, 2457)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (224, 76, 2458)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (225, 76, 2459)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (226, 76, 2460)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (227, 76, 2461)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (228, 76, 2462)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (229, 76, 2463)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (230, 76, 2464)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (231, 76, 2465)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (232, 76, 2466)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (233, 76, 2467)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (234, 76, 2468)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (235, 78, 153)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (236, 78, 168)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (237, 78, 193)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (238, 78, 194)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (239, 78, 195)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (240, 78, 196)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (241, 78, 197)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (242, 78, 198)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (243, 78, 199)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (244, 78, 200)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (245, 78, 201)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (246, 78, 202)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (247, 78, 203)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (248, 78, 204)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (249, 78, 205)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (250, 78, 206)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (251, 78, 207)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (252, 78, 208)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (253, 78, 209)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (254, 78, 210)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (255, 78, 211)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (256, 78, 212)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (257, 78, 213)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (258, 78, 214)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (259, 78, 215)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (260, 78, 216)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (261, 78, 217)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (262, 78, 218)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (263, 78, 219)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (264, 78, 220)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (265, 78, 221)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (266, 78, 222)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (267, 78, 223)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (268, 78, 224)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (269, 78, 225)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (270, 78, 226)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (271, 78, 227)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (272, 78, 228)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (273, 78, 229)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (274, 78, 230)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (275, 78, 231)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (276, 78, 232)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (277, 78, 233)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (278, 78, 234)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (279, 78, 235)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (280, 78, 236)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (281, 78, 237)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (282, 78, 238)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (283, 78, 239)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (284, 78, 240)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (285, 78, 241)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (286, 78, 242)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (287, 78, 243)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (288, 78, 244)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (289, 78, 245)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (290, 78, 246)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (291, 78, 247)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (292, 78, 248)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (293, 78, 249)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (294, 78, 250)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (295, 78, 251)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (296, 78, 252)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (297, 78, 253)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (298, 78, 254)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (299, 78, 255)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (300, 78, 256)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (301, 78, 257)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (302, 78, 258)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (303, 78, 387)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (304, 78, 551)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (305, 78, 596)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (306, 78, 625)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (307, 78, 1197)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (308, 78, 1396)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (309, 78, 1416)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (310, 78, 1543)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (311, 78, 1747)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (312, 78, 1749)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (313, 78, 1750)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (314, 78, 1812)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (315, 78, 1866)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (316, 78, 1867)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (317, 78, 1885)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (318, 78, 1894)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (319, 78, 1905)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (320, 78, 1939)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (321, 78, 2192)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (322, 78, 2265)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (323, 78, 2323)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (324, 78, 2466)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (325, 79, 94)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (326, 79, 173)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (327, 79, 238)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (328, 79, 301)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (329, 79, 311)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (330, 79, 316)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (331, 79, 343)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (332, 79, 358)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (333, 79, 359)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (334, 79, 360)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (335, 79, 361)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (336, 79, 362)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (337, 79, 363)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (338, 79, 364)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (339, 79, 365)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (340, 79, 366)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (341, 79, 367)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (342, 79, 368)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (343, 79, 369)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (344, 79, 370)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (345, 79, 371)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (346, 79, 372)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (347, 79, 373)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (348, 79, 374)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (349, 79, 375)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (350, 79, 376)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (351, 79, 377)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (352, 79, 378)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (353, 79, 379)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (354, 79, 380)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (355, 79, 381)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (356, 79, 382)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (357, 79, 383)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (358, 79, 384)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (359, 79, 385)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (360, 79, 386)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (361, 79, 387)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (362, 79, 388)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (363, 79, 389)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (364, 79, 390)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (365, 79, 391)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (366, 79, 392)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (367, 79, 393)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (368, 79, 394)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (369, 79, 395)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (370, 79, 396)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (371, 79, 397)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (372, 79, 398)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (373, 79, 399)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (374, 79, 400)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (375, 79, 401)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (376, 79, 402)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (377, 79, 403)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (378, 79, 404)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (379, 79, 405)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (380, 79, 406)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (381, 79, 407)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (382, 79, 408)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (383, 79, 409)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (384, 79, 410)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (385, 79, 411)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (386, 79, 412)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (387, 79, 413)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (388, 79, 414)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (389, 79, 415)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (390, 79, 416)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (391, 79, 417)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (392, 79, 418)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (393, 79, 419)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (394, 79, 420)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (395, 79, 421)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (396, 79, 422)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (397, 79, 423)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (398, 79, 424)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (399, 79, 425)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (400, 79, 426)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (401, 79, 427)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (402, 79, 428)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (403, 79, 429)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (404, 79, 430)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (405, 79, 431)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (406, 79, 432)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (407, 79, 433)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (408, 79, 434)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (409, 79, 435)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (410, 79, 436)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (411, 79, 437)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (412, 79, 438)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (413, 79, 439)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (414, 79, 440)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (415, 79, 441)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (416, 79, 442)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (417, 79, 443)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (418, 79, 444)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (419, 79, 445)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (420, 79, 446)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (421, 79, 447)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (422, 79, 448)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (423, 79, 449)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (424, 79, 450)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (425, 79, 451)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (426, 79, 452)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (427, 79, 453)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (428, 79, 454)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (429, 79, 455)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (430, 79, 456)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (431, 79, 457)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (432, 79, 458)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (433, 79, 459)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (434, 79, 460)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (435, 79, 461)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (436, 79, 462)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (437, 79, 463)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (438, 79, 464)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (439, 79, 465)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (440, 79, 466)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (441, 79, 467)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (442, 79, 468)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (443, 79, 469)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (444, 79, 470)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (445, 79, 471)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (446, 79, 472)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (447, 79, 473)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (448, 79, 474)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (449, 79, 475)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (450, 79, 476)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (451, 79, 477)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (452, 79, 478)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (453, 79, 479)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (454, 79, 480)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (455, 79, 481)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (456, 79, 482)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (457, 79, 483)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (458, 79, 484)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (459, 79, 485)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (460, 79, 486)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (461, 79, 487)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (462, 79, 488)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (463, 79, 489)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (464, 79, 490)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (465, 79, 491)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (466, 79, 492)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (467, 79, 493)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (468, 79, 494)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (469, 79, 495)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (470, 79, 496)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (471, 79, 497)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (472, 79, 498)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (473, 79, 499)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (474, 79, 500)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (475, 79, 501)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (476, 79, 502)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (477, 79, 503)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (478, 79, 504)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (479, 79, 505)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (480, 79, 506)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (481, 79, 507)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (482, 79, 508)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (483, 79, 509)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (484, 79, 510)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (485, 79, 511)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (486, 79, 512)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (487, 79, 513)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (488, 79, 514)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (489, 79, 515)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (490, 79, 516)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (491, 79, 517)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (492, 79, 535)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (493, 79, 538)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (494, 79, 563)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (495, 79, 566)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (496, 79, 642)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (497, 79, 657)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (498, 79, 677)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (499, 79, 758)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (500, 79, 823)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (501, 79, 946)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (502, 79, 1003)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (503, 79, 1037)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (504, 79, 1091)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (505, 79, 1095)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (506, 79, 1124)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (507, 79, 1202)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (508, 79, 1238)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (509, 79, 1241)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (510, 79, 1340)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (511, 79, 1370)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (512, 79, 1374)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (513, 79, 1434)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (514, 79, 1439)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (515, 79, 1448)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (516, 79, 1467)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (517, 79, 1533)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (518, 79, 1541)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (519, 79, 1616)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (520, 79, 1654)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (521, 79, 1669)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (522, 79, 1752)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (523, 79, 1827)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (524, 79, 1837)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (525, 79, 1864)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (526, 79, 1881)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (527, 79, 1904)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (528, 79, 1933)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (529, 79, 1939)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (530, 79, 1950)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (531, 79, 1968)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (532, 79, 2006)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (533, 79, 2018)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (534, 79, 2191)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (535, 79, 2434)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (536, 79, 2449)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (537, 79, 2463)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (538, 80, 2072)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (539, 80, 2073)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (540, 80, 2074)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (541, 80, 2075)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (542, 80, 2076)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (543, 80, 2077)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (544, 80, 2078)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (545, 80, 2079)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (546, 80, 2080)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (547, 80, 2081)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (548, 80, 2082)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (549, 81, 114)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (550, 81, 219)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (551, 81, 281)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (552, 81, 324)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (553, 81, 412)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (554, 81, 548)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (555, 81, 740)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (556, 81, 935)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (557, 81, 1110)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (558, 81, 1118)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (559, 81, 1119)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (560, 81, 1121)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (561, 81, 1122)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (562, 81, 1123)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (563, 81, 1124)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (564, 81, 1125)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (565, 81, 1126)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (566, 81, 1127)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (567, 81, 1128)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (568, 81, 1129)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (569, 81, 1130)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (570, 81, 1131)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (571, 81, 1132)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (572, 81, 1133)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (573, 81, 1134)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (574, 81, 1135)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (575, 81, 1136)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (576, 81, 1137)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (577, 81, 1138)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (578, 81, 1139)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (579, 81, 1140)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (580, 81, 1141)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (581, 81, 1142)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (582, 81, 1143)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (583, 81, 1144)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (584, 81, 1145)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (585, 81, 1146)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (586, 81, 1147)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (587, 81, 1148)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (588, 81, 1149)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (589, 81, 1150)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (590, 81, 1151)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (591, 81, 1153)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (592, 81, 1154)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (593, 81, 1155)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (594, 81, 1157)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (595, 81, 1158)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (596, 81, 1159)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (597, 81, 1160)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (598, 81, 1161)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (599, 81, 1163)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (600, 81, 1165)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (601, 81, 1166)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (602, 81, 1168)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (603, 81, 1169)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (604, 81, 1170)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (605, 81, 1172)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (606, 81, 1173)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (607, 81, 1174)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (608, 81, 1175)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (609, 81, 1176)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (610, 81, 1178)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (611, 81, 1179)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (612, 81, 1180)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (613, 81, 1181)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (614, 81, 1182)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (615, 81, 1183)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (616, 81, 1184)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (617, 81, 1185)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (618, 81, 1186)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (619, 81, 1189)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (620, 81, 1190)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (621, 81, 1191)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (622, 81, 1192)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (623, 81, 1193)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (624, 81, 1194)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (625, 81, 1195)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (626, 81, 1196)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (627, 81, 1197)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (628, 81, 1198)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (629, 81, 1199)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (630, 81, 1200)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (631, 81, 1201)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (632, 81, 1232)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (633, 81, 1277)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (634, 81, 1332)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (635, 81, 1408)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (636, 81, 1751)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (637, 81, 2169)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (638, 81, 2251)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (639, 81, 2265)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (640, 81, 2357)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (641, 82, 166)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (642, 82, 167)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (643, 82, 168)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (644, 82, 169)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (645, 82, 170)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (646, 82, 171)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (647, 82, 172)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (648, 82, 173)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (649, 82, 174)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (650, 82, 175)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (651, 82, 176)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (652, 82, 177)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (653, 82, 178)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (654, 82, 179)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (655, 82, 180)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (656, 82, 181)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (657, 82, 182)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (658, 82, 183)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (659, 82, 184)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (660, 82, 185)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (661, 82, 186)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (662, 82, 187)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (663, 82, 188)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (664, 82, 189)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (665, 82, 190)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (666, 82, 191)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (667, 82, 192)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (668, 82, 209)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (669, 82, 510)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (670, 82, 556)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (671, 82, 701)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (672, 82, 1095)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (673, 82, 1341)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (674, 82, 1403)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (675, 82, 1575)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (676, 82, 1867)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (677, 82, 1885)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (678, 82, 2025)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (679, 82, 2434)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (680, 82, 2449)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (681, 82, 143)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (682, 82, 146)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (683, 82, 153)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (684, 82, 163)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (685, 82, 202)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (686, 82, 217)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (687, 82, 242)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (688, 82, 488)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (689, 82, 549)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (690, 82, 935)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (691, 82, 986)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (692, 82, 1121)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (693, 82, 1296)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (694, 82, 1430)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (695, 82, 1437)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (696, 82, 1570)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (697, 82, 1657)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (698, 82, 1706)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (699, 82, 1707)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (700, 82, 1708)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (701, 82, 1709)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (702, 82, 1710)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (703, 82, 1711)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (704, 82, 1712)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (705, 82, 1713)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (706, 82, 1714)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (707, 82, 1715)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (708, 82, 1716)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (709, 82, 1717)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (710, 82, 1718)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (711, 82, 1719)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (712, 82, 1720)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (713, 82, 1721)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (714, 82, 1722)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (715, 82, 1723)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (716, 82, 1724)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (717, 82, 1725)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (718, 82, 1726)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (719, 82, 1727)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (720, 82, 1728)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (721, 82, 1729)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (722, 82, 1730)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (723, 82, 1731)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (724, 82, 1732)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (725, 82, 1733)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (726, 82, 1734)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (727, 82, 1735)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (728, 82, 1736)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (729, 82, 1737)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (730, 82, 1738)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (731, 82, 1739)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (732, 82, 1740)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (733, 82, 1741)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (734, 82, 1742)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (735, 82, 1743)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (736, 82, 1744)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (737, 82, 1745)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (738, 82, 1746)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (739, 82, 1747)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (740, 82, 1748)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (741, 82, 1749)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (742, 82, 1750)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (743, 82, 1751)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (744, 82, 1752)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (745, 82, 1753)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (746, 82, 1754)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (747, 82, 1755)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (748, 82, 1756)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (749, 82, 1757)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (750, 82, 1758)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (751, 82, 1759)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (752, 82, 1760)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (753, 82, 1761)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (754, 82, 1762)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (755, 82, 1763)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (756, 82, 1764)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (757, 82, 1765)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (758, 82, 1766)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (759, 82, 1767)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (760, 82, 1768)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (761, 82, 1769)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (762, 82, 1770)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (763, 82, 1771)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (764, 82, 1772)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (765, 82, 1773)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (766, 82, 1774)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (767, 82, 1775)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (768, 82, 1776)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (769, 82, 1777)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (770, 82, 1778)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (771, 82, 1779)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (772, 82, 1780)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (773, 82, 1781)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (774, 82, 1782)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (775, 82, 1783)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (776, 82, 1784)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (777, 82, 1785)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (778, 82, 1786)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (779, 82, 1787)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (780, 82, 1788)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (781, 82, 1789)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (782, 82, 1790)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (783, 82, 1791)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (784, 82, 1905)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (785, 82, 1931)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (786, 82, 1996)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (787, 82, 2066)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (788, 82, 2334)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (789, 82, 2357)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (790, 85, 137)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (791, 85, 322)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (792, 85, 346)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (793, 85, 383)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (794, 85, 496)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (795, 85, 569)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (796, 85, 647)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (797, 85, 823)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (798, 85, 1003)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (799, 85, 1037)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (800, 85, 1089)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (801, 85, 1091)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (802, 85, 1226)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (803, 85, 1538)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (804, 85, 1625)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (805, 85, 1626)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (806, 85, 1627)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (807, 85, 1628)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (808, 85, 1629)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (809, 85, 1630)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (810, 85, 1631)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (811, 85, 1632)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (812, 85, 1633)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (813, 85, 1634)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (814, 85, 1635)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (815, 85, 1636)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (816, 85, 1637)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (817, 85, 1638)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (818, 85, 1639)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (819, 85, 1640)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (820, 85, 1641)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (821, 85, 1642)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (822, 85, 1643)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (823, 85, 1644)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (824, 85, 1645)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (825, 85, 1646)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (826, 85, 1647)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (827, 85, 1648)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (828, 85, 1649)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (829, 85, 1650)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (830, 85, 1651)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (831, 85, 1652)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (832, 85, 1653)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (833, 85, 1654)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (834, 85, 1656)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (835, 85, 1657)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (836, 85, 1658)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (837, 85, 1659)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (838, 85, 1660)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (839, 85, 1662)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (840, 85, 1663)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (841, 85, 1664)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (842, 85, 1666)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (843, 85, 1667)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (844, 85, 1668)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (845, 85, 1669)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (846, 85, 1670)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (847, 85, 1671)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (848, 85, 1673)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (849, 85, 1674)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (850, 85, 1675)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (851, 85, 1676)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (852, 85, 1677)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (853, 85, 1678)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (854, 85, 1679)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (855, 85, 1680)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (856, 85, 1681)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (857, 85, 1682)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (858, 85, 1684)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (859, 85, 1686)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (860, 85, 1687)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (861, 85, 1688)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (862, 85, 1689)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (863, 85, 1690)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (864, 85, 1691)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (865, 85, 1692)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (866, 85, 1693)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (867, 85, 1695)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (868, 85, 1696)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (869, 85, 1697)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (870, 85, 1698)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (871, 85, 1699)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (872, 85, 1700)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (873, 85, 1701)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (874, 85, 1702)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (875, 85, 1703)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (876, 85, 1705)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (877, 85, 1757)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (878, 85, 1837)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (879, 85, 1858)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (880, 85, 1881)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (881, 85, 1904)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (882, 85, 1917)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (883, 85, 1971)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (884, 85, 2006)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (885, 85, 2172)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (886, 86, 70)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (887, 86, 71)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (888, 86, 72)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (889, 86, 73)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (890, 86, 74)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (891, 86, 75)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (892, 86, 76)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (893, 86, 77)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (894, 86, 78)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (895, 86, 79)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (896, 86, 80)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (897, 86, 81)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (898, 86, 82)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (899, 86, 83)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (900, 86, 84)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (901, 86, 85)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (902, 86, 86)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (903, 86, 87)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (904, 86, 88)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (905, 86, 89)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (906, 86, 90)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (907, 86, 91)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (908, 86, 92)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (909, 86, 93)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (910, 86, 94)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (911, 86, 95)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (912, 86, 96)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (913, 86, 97)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (914, 86, 98)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (915, 86, 99)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (916, 86, 102)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (917, 86, 104)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (918, 86, 105)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (919, 86, 106)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (920, 86, 108)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (921, 86, 109)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (922, 86, 110)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (923, 86, 111)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (924, 86, 112)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (925, 86, 113)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (926, 86, 114)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (927, 86, 116)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (928, 86, 117)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (929, 86, 118)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (930, 86, 119)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (931, 86, 120)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (932, 86, 121)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (933, 86, 122)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (934, 86, 123)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (935, 86, 124)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (936, 86, 125)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (937, 86, 126)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (938, 86, 127)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (939, 86, 128)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (940, 86, 129)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (941, 86, 130)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (942, 86, 131)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (943, 86, 132)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (944, 86, 133)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (945, 86, 134)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (946, 86, 135)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (947, 86, 136)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (948, 86, 137)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (949, 86, 138)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (950, 86, 140)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (951, 86, 142)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (952, 86, 143)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (953, 86, 144)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (954, 86, 145)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (955, 86, 146)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (956, 86, 147)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (957, 86, 459)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (958, 86, 542)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (959, 86, 548)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (960, 86, 549)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (961, 86, 559)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (962, 86, 657)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (963, 86, 671)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (964, 86, 740)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (965, 86, 802)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (966, 86, 929)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (967, 86, 971)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (968, 86, 1009)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (969, 86, 1043)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (970, 86, 1127)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (971, 86, 1218)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (972, 86, 1239)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (973, 86, 1243)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (974, 86, 1315)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (975, 86, 1337)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (976, 86, 1431)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (977, 86, 1487)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (978, 86, 1692)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (979, 86, 1766)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (980, 86, 1780)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (981, 86, 1784)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (982, 86, 1927)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (983, 86, 1944)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (984, 86, 2010)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (985, 86, 2135)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (986, 86, 2169)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (987, 86, 2248)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (988, 86, 2268)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (989, 86, 2410)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (990, 86, 112)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (991, 86, 122)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (992, 86, 125)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (993, 86, 343)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (994, 86, 370)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (995, 86, 391)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (996, 86, 393)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (997, 86, 538)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (998, 86, 569)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (999, 86, 671)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1000, 86, 681)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1001, 86, 1043)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1002, 86, 1074)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1003, 86, 1110)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1004, 86, 1146)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1005, 86, 1179)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1006, 86, 1202)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1007, 86, 1203)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1008, 86, 1204)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1009, 86, 1205)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1010, 86, 1206)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1011, 86, 1207)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1012, 86, 1208)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1013, 86, 1209)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1014, 86, 1210)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1015, 86, 1211)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1016, 86, 1212)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1017, 86, 1213)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1018, 86, 1214)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1019, 86, 1215)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1020, 86, 1216)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1021, 86, 1217)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1022, 86, 1218)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1023, 86, 1219)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1024, 86, 1220)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1025, 86, 1221)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1026, 86, 1222)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1027, 86, 1223)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1028, 86, 1224)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1029, 86, 1225)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1030, 86, 1226)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1031, 86, 1227)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1032, 86, 1228)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1033, 86, 1229)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1034, 86, 1230)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1035, 86, 1231)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1036, 86, 1232)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1037, 86, 1233)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1038, 86, 1234)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1039, 86, 1235)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1040, 86, 1236)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1041, 86, 1237)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1042, 86, 1238)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1043, 86, 1239)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1044, 86, 1240)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1045, 86, 1241)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1046, 86, 1242)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1047, 86, 1243)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1048, 86, 1244)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1049, 86, 1246)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1050, 86, 1247)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1051, 86, 1248)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1052, 86, 1249)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1053, 86, 1250)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1054, 86, 1251)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1055, 86, 1252)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1056, 86, 1253)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1057, 86, 1254)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1058, 86, 1255)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1059, 86, 1256)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1060, 86, 1257)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1061, 86, 1258)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1062, 86, 1259)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1063, 86, 1260)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1064, 86, 1261)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1065, 86, 1262)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1066, 86, 1263)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1067, 86, 1264)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1068, 86, 1267)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1069, 86, 1268)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1070, 86, 1269)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1071, 86, 1270)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1072, 86, 1271)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1073, 86, 1274)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1074, 86, 1275)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1075, 86, 1276)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1076, 86, 1277)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1077, 86, 1278)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1078, 86, 1279)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1079, 86, 1281)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1080, 86, 1282)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1081, 86, 1285)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1082, 86, 1286)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1083, 86, 1287)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1084, 86, 1288)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1085, 86, 1289)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1086, 86, 1290)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1087, 86, 1291)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1088, 86, 1293)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1089, 86, 1294)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1090, 86, 1295)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1091, 86, 1296)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1092, 86, 1297)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1093, 86, 1298)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1094, 86, 1299)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1095, 86, 1300)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1096, 86, 1301)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1097, 86, 1302)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1098, 86, 1303)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1099, 86, 1304)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1100, 86, 1305)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1101, 86, 1306)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1102, 86, 1307)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1103, 86, 1308)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1104, 86, 1309)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1105, 86, 1320)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1106, 86, 1330)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1107, 86, 1386)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1108, 86, 1659)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1109, 86, 1788)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1110, 86, 1819)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1111, 86, 1860)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1112, 86, 1864)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1113, 86, 1898)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1114, 86, 1899)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1115, 86, 1937)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1116, 86, 1953)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1117, 86, 2267)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1118, 86, 2278)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1119, 86, 2419)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1120, 88, 221)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1121, 88, 233)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1122, 88, 385)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1123, 88, 486)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1124, 88, 596)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1125, 88, 647)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1126, 88, 758)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1127, 88, 776)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1128, 88, 923)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1129, 88, 979)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1130, 88, 1006)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1131, 88, 1519)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1132, 88, 1520)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1133, 88, 1521)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1134, 88, 1522)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1135, 88, 1523)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1136, 88, 1524)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1137, 88, 1525)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1138, 88, 1526)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1139, 88, 1527)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1140, 88, 1528)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1141, 88, 1529)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1142, 88, 1530)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1143, 88, 1531)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1144, 88, 1532)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1145, 88, 1533)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1146, 88, 1534)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1147, 88, 1535)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1148, 88, 1536)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1149, 88, 1537)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1150, 88, 1538)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1151, 88, 1539)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1152, 88, 1540)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1153, 88, 1541)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1154, 88, 1542)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1155, 88, 1543)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1156, 88, 1544)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1157, 88, 1545)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1158, 88, 1546)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1159, 88, 1547)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1160, 88, 1548)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1161, 88, 1549)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1162, 88, 1550)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1163, 88, 1551)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1164, 88, 1552)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1165, 88, 1553)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1166, 88, 1554)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1167, 88, 1555)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1168, 88, 1556)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1169, 88, 1557)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1170, 88, 1558)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1171, 88, 1643)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1172, 88, 1812)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1173, 88, 1866)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1174, 88, 1887)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1175, 88, 1901)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1176, 88, 1908)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1177, 88, 2180)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1178, 89, 125)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1179, 89, 465)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1180, 89, 661)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1181, 89, 662)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1182, 89, 663)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1183, 89, 664)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1184, 89, 665)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1185, 89, 666)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1186, 89, 667)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1187, 89, 668)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1188, 89, 669)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1189, 89, 670)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1190, 89, 671)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1191, 89, 672)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1192, 89, 673)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1193, 89, 674)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1194, 89, 675)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1195, 89, 676)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1196, 89, 677)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1197, 89, 678)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1198, 89, 679)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1199, 89, 680)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1200, 89, 681)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1201, 89, 682)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1202, 89, 683)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1203, 89, 684)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1204, 89, 790)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1205, 89, 1043)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1206, 89, 1239)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1207, 89, 1294)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1208, 89, 1356)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1209, 90, 125)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1210, 90, 145)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1211, 90, 159)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1212, 90, 173)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1213, 90, 383)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1214, 90, 496)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1215, 90, 510)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1216, 90, 524)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1217, 90, 671)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1218, 90, 704)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1219, 90, 809)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1220, 90, 823)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1221, 90, 988)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1222, 90, 989)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1223, 90, 990)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1224, 90, 991)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1225, 90, 992)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1226, 90, 993)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1227, 90, 994)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1228, 90, 995)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1229, 90, 996)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1230, 90, 997)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1231, 90, 998)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1232, 90, 999)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1233, 90, 1000)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1234, 90, 1001)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1235, 90, 1002)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1236, 90, 1003)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1237, 90, 1004)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1238, 90, 1005)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1239, 90, 1006)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1240, 90, 1007)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1241, 90, 1008)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1242, 90, 1009)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1243, 90, 1010)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1244, 90, 1012)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1245, 90, 1013)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1246, 90, 1014)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1247, 90, 1015)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1248, 90, 1016)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1249, 90, 1017)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1250, 90, 1019)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1251, 90, 1020)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1252, 90, 1021)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1253, 90, 1022)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1254, 90, 1023)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1255, 90, 1024)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1256, 90, 1025)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1257, 90, 1026)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1258, 90, 1027)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1259, 90, 1028)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1260, 90, 1029)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1261, 90, 1030)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1262, 90, 1031)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1263, 90, 1032)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1264, 90, 1033)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1265, 90, 1034)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1266, 90, 1037)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1267, 90, 1038)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1268, 90, 1040)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1269, 90, 1041)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1270, 90, 1043)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1271, 90, 1044)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1272, 90, 1045)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1273, 90, 1047)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1274, 90, 1050)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1275, 90, 1051)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1276, 90, 1052)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1277, 90, 1053)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1278, 90, 1054)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1279, 90, 1055)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1280, 90, 1057)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1281, 90, 1059)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1282, 90, 1060)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1283, 90, 1061)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1284, 90, 1063)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1285, 90, 1068)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1286, 90, 1069)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1287, 90, 1071)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1288, 90, 1073)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1289, 90, 1074)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1290, 90, 1075)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1291, 90, 1077)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1292, 90, 1078)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1293, 90, 1079)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1294, 90, 1080)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1295, 90, 1081)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1296, 90, 1086)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1297, 90, 1088)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1298, 90, 1089)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1299, 90, 1090)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1300, 90, 1091)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1301, 90, 1092)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1302, 90, 1095)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1303, 90, 1099)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1304, 90, 1101)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1305, 90, 1102)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1306, 90, 1107)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1307, 90, 1108)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1308, 90, 1109)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1309, 90, 1110)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1310, 90, 1112)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1311, 90, 1113)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1312, 90, 1114)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1313, 90, 1116)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1314, 90, 1118)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1315, 90, 1179)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1316, 90, 1191)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1317, 90, 1239)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1318, 90, 1277)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1319, 90, 1295)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1320, 90, 1468)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1321, 90, 1478)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1322, 90, 1486)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1323, 90, 1542)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1324, 90, 1579)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1325, 90, 1635)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1326, 90, 1654)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1327, 90, 1669)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1328, 90, 1837)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1329, 90, 1881)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1330, 90, 1904)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1331, 90, 1927)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1332, 90, 1992)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1333, 90, 2006)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1334, 90, 2063)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1335, 90, 2108)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1336, 90, 2180)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1337, 90, 2258)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1338, 90, 2263)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1339, 90, 2434)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1340, 90, 2449)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1341, 90, 2455)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1342, 90, 2464)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1343, 91, 87)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1344, 91, 104)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1345, 91, 145)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1346, 91, 188)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1347, 91, 238)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1348, 91, 342)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1349, 91, 387)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1350, 91, 406)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1351, 91, 414)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1352, 91, 483)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1353, 91, 491)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1354, 91, 496)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1355, 91, 511)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1356, 91, 542)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1357, 91, 556)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1358, 91, 645)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1359, 91, 653)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1360, 91, 703)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1361, 91, 823)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1362, 91, 873)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1363, 91, 942)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1364, 91, 989)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1365, 91, 1009)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1366, 91, 1019)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1367, 91, 1037)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1368, 91, 1091)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1369, 91, 1216)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1370, 91, 1262)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1371, 91, 1313)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1372, 91, 1341)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1373, 91, 1361)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1374, 91, 1415)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1375, 91, 1437)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1376, 91, 1438)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1377, 91, 1483)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1378, 91, 1634)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1379, 91, 1654)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1380, 91, 1687)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1381, 91, 1715)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1382, 91, 1744)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1383, 91, 1790)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1384, 91, 1796)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1385, 91, 1802)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1386, 91, 1814)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1387, 91, 1819)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1388, 91, 1837)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1389, 91, 1860)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1390, 91, 1865)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1391, 91, 1881)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1392, 91, 1898)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1393, 91, 1899)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1394, 91, 1902)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1395, 91, 1904)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1396, 91, 1907)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1397, 91, 1909)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1398, 91, 1914)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1399, 91, 1915)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1400, 91, 1916)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1401, 91, 1917)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1402, 91, 1918)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1403, 91, 1919)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1404, 91, 1920)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1405, 91, 1921)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1406, 91, 1922)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1407, 91, 1923)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1408, 91, 1924)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1409, 91, 1925)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1410, 91, 1926)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1411, 91, 1927)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1412, 91, 1928)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1413, 91, 1929)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1414, 91, 1930)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1415, 91, 1931)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1416, 91, 1932)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1417, 91, 1933)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1418, 91, 1934)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1419, 91, 1935)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1420, 91, 1936)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1421, 91, 1937)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1422, 91, 1938)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1423, 91, 1939)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1424, 91, 1940)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1425, 91, 1941)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1426, 91, 1942)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1427, 91, 1943)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1428, 91, 1944)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1429, 91, 1945)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1430, 91, 1946)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1431, 91, 1947)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1432, 91, 1948)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1433, 91, 1949)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1434, 91, 1950)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1435, 91, 1951)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1436, 91, 1952)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1437, 91, 1953)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1438, 91, 1954)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1439, 91, 1955)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1440, 91, 1956)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1441, 91, 1957)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1442, 91, 1958)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1443, 91, 1959)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1444, 91, 1960)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1445, 91, 1961)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1446, 91, 1962)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1447, 91, 1963)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1448, 91, 1964)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1449, 91, 1965)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1450, 91, 1966)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1451, 91, 1967)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1452, 91, 1968)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1453, 91, 1969)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1454, 91, 1970)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1455, 91, 1971)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1456, 91, 1972)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1457, 91, 1973)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1458, 91, 1974)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1459, 91, 1975)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1460, 91, 1976)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1461, 91, 1977)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1462, 91, 1978)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1463, 91, 1979)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1464, 91, 1980)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1465, 91, 1981)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1466, 91, 1982)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1467, 91, 1983)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1468, 91, 1984)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1469, 91, 1985)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1470, 91, 1986)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1471, 91, 1987)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1472, 91, 1988)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1473, 91, 1989)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1474, 91, 1990)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1475, 91, 1991)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1476, 91, 1992)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1477, 91, 1993)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1478, 91, 1994)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1479, 91, 1995)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1480, 91, 1996)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1481, 91, 1997)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1482, 91, 1998)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1483, 91, 1999)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1484, 91, 2000)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1485, 91, 2001)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1486, 91, 2002)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1487, 91, 2003)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1488, 91, 2004)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1489, 91, 2005)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1490, 91, 2006)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1491, 91, 2007)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1492, 91, 2008)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1493, 91, 2009)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1494, 91, 2010)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1495, 91, 2011)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1496, 91, 2012)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1497, 91, 2013)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1498, 91, 2014)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1499, 91, 2015)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1500, 91, 2016)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1501, 91, 2017)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1502, 91, 2018)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1503, 91, 2019)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1504, 91, 2020)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1505, 91, 2021)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1506, 91, 2022)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1507, 91, 2023)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1508, 91, 2024)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1509, 91, 2025)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1510, 91, 2026)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1511, 91, 2027)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1512, 91, 2028)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1513, 91, 2029)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1514, 91, 2030)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1515, 91, 2031)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1516, 91, 2032)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1517, 91, 2033)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1518, 91, 2034)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1519, 91, 2035)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1520, 91, 2036)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1521, 91, 2037)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1522, 91, 2038)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1523, 91, 2039)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1524, 91, 2040)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1525, 91, 2041)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1526, 91, 2042)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1527, 91, 2043)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1528, 91, 2044)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1529, 91, 2045)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1530, 91, 2046)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1531, 91, 2047)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1532, 91, 2048)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1533, 91, 2049)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1534, 91, 2050)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1535, 91, 2051)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1536, 91, 2052)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1537, 91, 2053)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1538, 91, 2054)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1539, 91, 2055)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1540, 91, 2056)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1541, 91, 2057)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1542, 91, 2058)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1543, 91, 2059)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1544, 91, 2060)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1545, 91, 2061)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1546, 91, 2062)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1547, 91, 2063)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1548, 91, 2064)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1549, 91, 2065)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1550, 91, 2066)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1551, 91, 2067)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1552, 91, 2068)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1553, 91, 2069)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1554, 91, 2070)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1555, 91, 2071)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1556, 91, 2206)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1557, 91, 2261)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1558, 91, 2267)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1559, 91, 2285)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1560, 91, 2294)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1561, 91, 2334)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1562, 91, 2419)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1563, 91, 2443)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1564, 91, 2448)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1565, 92, 95)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1566, 92, 524)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1567, 92, 1033)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1568, 92, 1486)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1569, 92, 1605)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1570, 92, 2083)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1571, 92, 2084)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1572, 92, 2085)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1573, 92, 2086)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1574, 92, 2087)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1575, 92, 2088)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1576, 92, 2089)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1577, 92, 2090)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1578, 92, 2091)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1579, 92, 2092)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1580, 92, 2093)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1581, 92, 2094)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1582, 92, 2095)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1583, 92, 2096)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1584, 92, 2097)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1585, 92, 2098)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1586, 92, 2099)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1587, 92, 2100)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1588, 92, 2101)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1589, 92, 2102)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1590, 92, 2103)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1591, 92, 2104)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1592, 92, 2105)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1593, 92, 2106)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1594, 92, 2107)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1595, 92, 2108)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1596, 92, 2109)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1597, 92, 2110)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1598, 92, 2111)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1599, 92, 2112)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1600, 92, 2113)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1601, 92, 2114)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1602, 92, 2115)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1603, 92, 2116)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1604, 92, 2117)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1605, 92, 2118)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1606, 92, 2119)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1607, 92, 2120)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1608, 92, 2121)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1609, 92, 2122)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1610, 92, 2123)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1611, 92, 2124)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1612, 92, 2125)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1613, 92, 2126)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1614, 92, 2127)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1615, 92, 2128)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1616, 92, 2129)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1617, 92, 2130)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1618, 92, 2131)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1619, 92, 2132)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1620, 92, 2133)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1621, 92, 2134)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1622, 92, 2135)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1623, 92, 2136)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1624, 92, 2137)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1625, 92, 2138)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1626, 92, 2139)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1627, 92, 2140)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1628, 92, 2141)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1629, 92, 2142)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1630, 92, 2143)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1631, 92, 2144)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1632, 92, 2145)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1633, 92, 2146)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1634, 92, 2147)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1635, 92, 2148)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1636, 92, 2149)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1637, 92, 2150)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1638, 92, 2151)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1639, 92, 2152)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1640, 92, 2153)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1641, 92, 2154)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1642, 92, 2155)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1643, 92, 2156)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1644, 92, 2157)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1645, 92, 2158)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1646, 92, 2159)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1647, 92, 2160)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1648, 92, 2161)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1649, 92, 2162)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1650, 93, 159)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1651, 93, 163)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1652, 93, 185)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1653, 93, 701)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1654, 93, 865)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1655, 93, 897)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1656, 93, 1080)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1657, 93, 1508)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1658, 93, 1560)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1659, 93, 1561)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1660, 93, 1562)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1661, 93, 1563)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1662, 93, 1564)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1663, 93, 1565)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1664, 93, 1566)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1665, 93, 1567)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1666, 93, 1568)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1667, 93, 1569)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1668, 93, 1570)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1669, 93, 1571)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1670, 93, 1572)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1671, 93, 1573)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1672, 93, 1574)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1673, 93, 1575)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1674, 93, 1576)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1675, 93, 1578)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1676, 93, 1579)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1677, 93, 1580)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1678, 93, 1581)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1679, 93, 1582)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1680, 93, 1583)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1681, 93, 1584)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1682, 93, 1585)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1683, 93, 1721)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1684, 94, 102)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1685, 94, 180)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1686, 94, 194)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1687, 94, 244)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1688, 94, 260)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1689, 94, 324)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1690, 94, 344)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1691, 94, 425)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1692, 94, 433)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1693, 94, 447)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1694, 94, 493)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1695, 94, 690)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1696, 94, 718)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1697, 94, 887)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1698, 94, 946)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1699, 94, 966)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1700, 94, 1025)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1701, 94, 1192)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1702, 94, 1390)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1703, 94, 1391)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1704, 94, 1392)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1705, 94, 1393)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1706, 94, 1394)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1707, 94, 1395)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1708, 94, 1396)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1709, 94, 1397)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1710, 94, 1398)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1711, 94, 1399)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1712, 94, 1400)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1713, 94, 1401)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1714, 94, 1402)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1715, 94, 1403)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1716, 94, 1404)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1717, 94, 1405)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1718, 94, 1406)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1719, 94, 1407)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1720, 94, 1408)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1721, 94, 1409)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1722, 94, 1410)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1723, 94, 1411)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1724, 94, 1412)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1725, 94, 1413)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1726, 94, 1414)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1727, 94, 1415)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1728, 94, 1416)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1729, 94, 1417)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1730, 94, 1418)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1731, 94, 1419)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1732, 94, 1420)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1733, 94, 1421)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1734, 94, 1422)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1735, 94, 1423)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1736, 94, 1424)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1737, 94, 1425)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1738, 94, 1426)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1739, 94, 1427)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1740, 94, 1428)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1741, 94, 1429)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1742, 94, 1430)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1743, 94, 1431)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1744, 94, 1432)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1745, 94, 1433)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1746, 94, 1434)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1747, 94, 1435)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1748, 94, 1436)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1749, 94, 1437)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1750, 94, 1438)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1751, 94, 1439)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1752, 94, 1440)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1753, 94, 1441)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1754, 94, 1442)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1755, 94, 1443)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1756, 94, 1444)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1757, 94, 1445)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1758, 94, 1446)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1759, 94, 1447)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1760, 94, 1448)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1761, 94, 1449)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1762, 94, 1450)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1763, 94, 1451)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1764, 94, 1452)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1765, 94, 1453)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1766, 94, 1454)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1767, 94, 1455)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1768, 94, 1456)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1769, 94, 1457)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1770, 94, 1458)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1771, 94, 1459)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1772, 94, 1460)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1773, 94, 1461)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1774, 94, 1462)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1775, 94, 1463)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1776, 94, 1464)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1777, 94, 1465)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1778, 94, 1466)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1779, 94, 1467)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1780, 94, 1468)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1781, 94, 1723)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1782, 94, 1790)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1783, 94, 1821)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1784, 94, 1902)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1785, 94, 1998)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1786, 94, 2004)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1787, 94, 2066)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1788, 94, 2248)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1789, 94, 2334)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1790, 95, 501)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1791, 95, 824)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1792, 95, 960)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1793, 95, 1586)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1794, 95, 1587)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1795, 95, 1588)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1796, 95, 1589)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1797, 95, 1590)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1798, 95, 1591)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1799, 95, 1592)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1800, 95, 1593)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1801, 95, 1594)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1802, 95, 1595)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1803, 95, 1596)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1804, 95, 1597)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1805, 95, 1598)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1806, 95, 1599)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1807, 95, 1600)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1808, 95, 1601)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1809, 95, 1602)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1810, 95, 1603)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1811, 95, 1604)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1812, 95, 1605)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1813, 95, 1606)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1814, 95, 1607)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1815, 95, 1608)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1816, 95, 1609)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1817, 95, 1610)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1818, 95, 1611)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1819, 95, 1612)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1820, 95, 1613)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1821, 95, 1614)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1822, 95, 1616)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1823, 95, 1617)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1824, 95, 1618)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1825, 95, 1619)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1826, 95, 1620)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1827, 95, 1621)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1828, 95, 1622)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1829, 95, 1623)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1830, 95, 1624)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1831, 95, 2152)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1832, 95, 2197)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1833, 97, 83)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1834, 97, 102)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1835, 97, 114)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1836, 97, 149)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1837, 97, 162)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1838, 97, 219)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1839, 97, 227)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1840, 97, 243)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1841, 97, 348)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1842, 97, 377)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1843, 97, 548)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1844, 97, 618)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1845, 97, 636)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1846, 97, 649)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1847, 97, 656)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1848, 97, 740)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1849, 97, 813)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1850, 97, 858)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1851, 97, 935)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1852, 97, 1006)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1853, 97, 1020)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1854, 97, 1088)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1855, 97, 1121)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1856, 97, 1127)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1857, 97, 1197)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1858, 97, 1198)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1859, 97, 1262)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1860, 97, 1308)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1861, 97, 1431)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1862, 97, 1437)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1863, 97, 1542)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1864, 97, 1591)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1865, 97, 1641)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1866, 97, 1751)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1867, 97, 1790)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1868, 97, 1796)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1869, 97, 1797)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1870, 97, 1814)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1871, 97, 1819)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1872, 97, 1860)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1873, 97, 1898)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1874, 97, 1899)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1875, 97, 1934)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1876, 97, 1953)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1877, 97, 1982)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1878, 97, 2017)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1879, 97, 2028)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1880, 97, 2039)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1881, 97, 2066)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1882, 97, 2163)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1883, 97, 2164)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1884, 97, 2165)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1885, 97, 2166)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1886, 97, 2167)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1887, 97, 2168)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1888, 97, 2169)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1889, 97, 2170)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1890, 97, 2171)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1891, 97, 2172)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1892, 97, 2173)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1893, 97, 2174)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1894, 97, 2175)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1895, 97, 2176)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1896, 97, 2177)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1897, 97, 2178)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1898, 97, 2179)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1899, 97, 2180)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1900, 97, 2181)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1901, 97, 2182)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1902, 97, 2183)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1903, 97, 2184)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1904, 97, 2185)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1905, 97, 2186)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1906, 97, 2187)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1907, 97, 2188)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1908, 97, 2189)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1909, 97, 2190)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1910, 97, 2191)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1911, 97, 2192)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1912, 97, 2193)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1913, 97, 2194)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1914, 97, 2195)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1915, 97, 2197)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1916, 97, 2198)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1917, 97, 2199)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1918, 97, 2200)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1919, 97, 2201)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1920, 97, 2202)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1921, 97, 2203)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1922, 97, 2204)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1923, 97, 2205)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1924, 97, 2206)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1925, 97, 2207)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1926, 97, 2208)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1927, 97, 2209)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1928, 97, 2210)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1929, 97, 2211)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1930, 97, 2212)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1931, 97, 2213)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1932, 97, 2214)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1933, 97, 2215)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1934, 97, 2216)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1935, 97, 2217)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1936, 97, 2218)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1937, 97, 2219)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1938, 97, 2220)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1939, 97, 2221)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1940, 97, 2222)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1941, 97, 2223)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1942, 97, 2224)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1943, 97, 2225)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1944, 97, 2226)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1945, 97, 2227)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1946, 97, 2228)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1947, 97, 2229)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1948, 97, 2230)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1949, 97, 2231)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1950, 97, 2232)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1951, 97, 2233)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1952, 97, 2234)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1953, 97, 2235)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1954, 97, 2236)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1955, 97, 2237)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1956, 97, 2238)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1957, 97, 2239)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1958, 97, 2240)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1959, 97, 2241)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1960, 97, 2242)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1961, 97, 2243)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1962, 97, 2244)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1963, 97, 2245)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1964, 97, 2246)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1965, 97, 2247)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1966, 97, 2248)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1967, 97, 2249)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1968, 97, 2250)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1969, 97, 2251)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1970, 97, 2252)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1971, 97, 2253)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1972, 97, 2254)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1973, 97, 2255)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1974, 97, 2256)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1975, 97, 2257)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1976, 97, 2258)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1977, 97, 2259)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1978, 97, 2260)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1979, 97, 2261)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1980, 97, 2262)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1981, 97, 2263)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1982, 97, 2264)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1983, 97, 2265)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1984, 97, 2266)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1985, 97, 2267)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1986, 97, 2268)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1987, 97, 2269)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1988, 97, 2270)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1989, 97, 2271)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1990, 97, 2272)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1991, 97, 2273)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1992, 97, 2274)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1993, 97, 2275)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1994, 97, 2276)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1995, 97, 2277)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1996, 97, 2278)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1997, 97, 2279)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1998, 97, 2280)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (1999, 97, 2281)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2000, 97, 2282)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2001, 97, 2283)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2002, 97, 2284)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2003, 97, 2285)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2004, 97, 2286)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2005, 97, 2287)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2006, 97, 2288)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2007, 97, 2289)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2008, 97, 2290)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2009, 97, 2291)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2010, 97, 2292)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2011, 97, 2293)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2012, 97, 2294)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2013, 97, 2295)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2014, 97, 2296)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2015, 97, 2297)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2016, 97, 2298)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2017, 97, 2299)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2018, 97, 2300)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2019, 97, 2301)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2020, 97, 2302)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2021, 97, 2303)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2022, 97, 2304)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2023, 97, 2305)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2024, 97, 2306)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2025, 97, 2307)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2026, 97, 2308)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2027, 97, 2309)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2028, 97, 2310)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2029, 97, 2311)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2030, 97, 2312)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2031, 97, 2313)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2032, 97, 2314)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2033, 97, 2315)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2034, 97, 2316)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2035, 97, 2317)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2036, 97, 2318)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2037, 97, 2319)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2038, 97, 2320)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2039, 97, 2321)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2040, 97, 2322)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2041, 97, 2323)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2042, 97, 2324)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2043, 97, 2325)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2044, 97, 2326)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2045, 97, 2327)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2046, 97, 2328)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2047, 97, 2329)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2048, 97, 2330)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2049, 97, 2331)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2050, 97, 2332)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2051, 97, 2333)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2052, 97, 2334)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2053, 97, 2335)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2054, 97, 2336)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2055, 97, 2337)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2056, 97, 2338)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2057, 97, 2339)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2058, 97, 2340)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2059, 97, 2341)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2060, 97, 2342)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2061, 97, 2343)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2062, 97, 2344)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2063, 97, 2345)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2064, 97, 2346)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2065, 97, 2347)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2066, 97, 2348)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2067, 97, 2349)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2068, 97, 2350)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2069, 97, 2351)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2070, 97, 2352)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2071, 97, 2353)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2072, 97, 2354)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2073, 97, 2355)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2074, 97, 2356)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2075, 97, 2357)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2076, 97, 2358)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2077, 97, 2359)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2078, 97, 2360)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2079, 97, 2361)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2080, 97, 2362)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2081, 97, 2363)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2082, 97, 2364)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2083, 97, 2365)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2084, 97, 2366)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2085, 97, 2367)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2086, 97, 2368)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2087, 97, 2369)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2088, 97, 2370)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2089, 97, 2371)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2090, 97, 2372)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2091, 97, 2373)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2092, 97, 2374)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2093, 97, 2375)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2094, 97, 2376)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2095, 97, 2377)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2096, 97, 2378)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2097, 97, 2379)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2098, 97, 2380)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2099, 97, 2381)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2100, 97, 2382)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2101, 97, 2383)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2102, 97, 2384)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2103, 97, 2385)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2104, 97, 2386)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2105, 97, 2387)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2106, 97, 2391)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2107, 97, 2419)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2108, 97, 2450)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2109, 98, 94)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2110, 98, 234)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2111, 98, 397)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2112, 98, 459)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2113, 98, 574)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2114, 98, 610)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2115, 98, 611)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2116, 98, 612)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2117, 98, 613)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2118, 98, 614)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2119, 98, 615)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2120, 98, 616)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2121, 98, 617)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2122, 98, 618)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2123, 98, 619)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2124, 98, 620)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2125, 98, 621)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2126, 98, 622)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2127, 98, 623)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2128, 98, 624)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2129, 98, 625)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2130, 98, 626)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2131, 98, 627)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2132, 98, 628)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2133, 98, 629)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2134, 98, 630)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2135, 98, 631)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2136, 98, 632)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2137, 98, 633)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2138, 98, 634)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2139, 98, 635)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2140, 98, 636)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2141, 98, 637)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2142, 98, 638)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2143, 98, 639)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2144, 98, 640)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2145, 98, 641)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2146, 98, 642)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2147, 98, 643)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2148, 98, 644)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2149, 98, 645)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2150, 98, 646)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2151, 98, 647)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2152, 98, 648)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2153, 98, 649)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2154, 98, 650)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2155, 98, 651)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2156, 98, 652)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2157, 98, 653)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2158, 98, 654)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2159, 98, 655)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2160, 98, 656)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2161, 98, 657)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2162, 98, 658)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2163, 98, 659)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2164, 98, 660)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2165, 98, 1538)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2166, 98, 1643)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2167, 98, 1974)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2168, 98, 2034)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2169, 98, 2168)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2170, 98, 2254)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2171, 98, 2262)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2172, 98, 2279)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2173, 98, 2354)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2174, 99, 88)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2175, 99, 114)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2176, 99, 185)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2177, 99, 286)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2178, 99, 297)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2179, 99, 357)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2180, 99, 385)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2181, 99, 496)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2182, 99, 548)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2183, 99, 558)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2184, 99, 664)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2185, 99, 685)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2186, 99, 686)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2187, 99, 687)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2188, 99, 688)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2189, 99, 689)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2190, 99, 690)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2191, 99, 691)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2192, 99, 692)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2193, 99, 693)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2194, 99, 694)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2195, 99, 695)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2196, 99, 696)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2197, 99, 697)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2198, 99, 698)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2199, 99, 699)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2200, 99, 700)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2201, 99, 701)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2202, 99, 702)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2203, 99, 703)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2204, 99, 704)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2205, 99, 705)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2206, 99, 706)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2207, 99, 707)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2208, 99, 708)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2209, 99, 709)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2210, 99, 710)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2211, 99, 711)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2212, 99, 712)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2213, 99, 714)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2214, 99, 715)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2215, 99, 716)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2216, 99, 717)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2217, 99, 718)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2218, 99, 719)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2219, 99, 720)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2220, 99, 721)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2221, 99, 722)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2222, 99, 723)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2223, 99, 724)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2224, 99, 725)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2225, 99, 726)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2226, 99, 727)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2227, 99, 728)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2228, 99, 729)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2229, 99, 730)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2230, 99, 731)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2231, 99, 732)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2232, 99, 733)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2233, 99, 734)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2234, 99, 735)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2235, 99, 736)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2236, 99, 737)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2237, 99, 738)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2238, 99, 739)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2239, 99, 740)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2240, 99, 741)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2241, 99, 742)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2242, 99, 743)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2243, 99, 744)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2244, 99, 745)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2245, 99, 746)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2246, 99, 747)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2247, 99, 748)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2248, 99, 749)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2249, 99, 750)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2250, 99, 751)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2251, 99, 752)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2252, 99, 753)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2253, 99, 754)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2254, 99, 755)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2255, 99, 756)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2256, 99, 757)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2257, 99, 758)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2258, 99, 759)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2259, 99, 760)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2260, 99, 761)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2261, 99, 762)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2262, 99, 763)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2263, 99, 764)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2264, 99, 765)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2265, 99, 766)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2266, 99, 767)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2267, 99, 768)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2268, 99, 769)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2269, 99, 770)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2270, 99, 771)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2271, 99, 772)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2272, 99, 773)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2273, 99, 774)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2274, 99, 775)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2275, 99, 776)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2276, 99, 777)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2277, 99, 778)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2278, 99, 779)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2279, 99, 780)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2280, 99, 781)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2281, 99, 782)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2282, 99, 783)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2283, 99, 784)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2284, 99, 785)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2285, 99, 786)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2286, 99, 787)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2287, 99, 788)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2288, 99, 789)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2289, 99, 790)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2290, 99, 791)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2291, 99, 792)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2292, 99, 793)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2293, 99, 794)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2294, 99, 795)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2295, 99, 796)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2296, 99, 797)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2297, 99, 798)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2298, 99, 799)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2299, 99, 800)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2300, 99, 801)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2301, 99, 802)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2302, 99, 803)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2303, 99, 804)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2304, 99, 805)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2305, 99, 806)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2306, 99, 807)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2307, 99, 808)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2308, 99, 809)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2309, 99, 810)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2310, 99, 811)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2311, 99, 812)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2312, 99, 813)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2313, 99, 814)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2314, 99, 815)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2315, 99, 816)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2316, 99, 817)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2317, 99, 818)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2318, 99, 819)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2319, 99, 820)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2320, 99, 821)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2321, 99, 822)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2322, 99, 823)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2323, 99, 824)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2324, 99, 825)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2325, 99, 826)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2326, 99, 827)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2327, 99, 828)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2328, 99, 829)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2329, 99, 830)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2330, 99, 831)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2331, 99, 832)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2332, 99, 833)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2333, 99, 834)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2334, 99, 835)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2335, 99, 836)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2336, 99, 837)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2337, 99, 838)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2338, 99, 839)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2339, 99, 840)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2340, 99, 841)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2341, 99, 842)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2342, 99, 843)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2343, 99, 844)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2344, 99, 845)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2345, 99, 846)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2346, 99, 847)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2347, 99, 848)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2348, 99, 849)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2349, 99, 850)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2350, 99, 851)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2351, 99, 852)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2352, 99, 853)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2353, 99, 854)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2354, 99, 855)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2355, 99, 856)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2356, 99, 857)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2357, 99, 858)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2358, 99, 859)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2359, 99, 860)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2360, 99, 861)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2361, 99, 862)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2362, 99, 863)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2363, 99, 864)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2364, 99, 865)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2365, 99, 866)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2366, 99, 867)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2367, 99, 868)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2368, 99, 869)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2369, 99, 870)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2370, 99, 871)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2371, 99, 872)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2372, 99, 873)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2373, 99, 874)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2374, 99, 875)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2375, 99, 876)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2376, 99, 877)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2377, 99, 931)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2378, 99, 1037)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2379, 99, 1061)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2380, 99, 1091)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2381, 99, 1108)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2382, 99, 1127)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2383, 99, 1382)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2384, 99, 1423)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2385, 99, 1455)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2386, 99, 1518)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2387, 99, 1521)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2388, 99, 1541)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2389, 99, 1575)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2390, 99, 1576)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2391, 99, 1624)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2392, 99, 1654)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2393, 99, 1837)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2394, 99, 1881)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2395, 99, 1904)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2396, 99, 1910)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2397, 99, 1926)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2398, 99, 1972)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2399, 99, 2006)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2400, 99, 2169)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2401, 99, 2177)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2402, 99, 2202)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2403, 100, 168)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2404, 100, 202)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2405, 100, 209)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2406, 100, 221)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2407, 100, 233)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2408, 100, 249)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2409, 100, 270)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2410, 100, 297)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2411, 100, 343)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2412, 100, 346)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2413, 100, 360)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2414, 100, 370)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2415, 100, 496)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2416, 100, 538)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2417, 100, 596)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2418, 100, 823)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2419, 100, 867)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2420, 100, 975)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2421, 100, 979)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2422, 100, 1037)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2423, 100, 1091)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2424, 100, 1241)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2425, 100, 1262)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2426, 100, 1313)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2427, 100, 1402)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2428, 100, 1415)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2429, 100, 1494)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2430, 100, 1522)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2431, 100, 1531)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2432, 100, 1543)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2433, 100, 1553)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2434, 100, 1648)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2435, 100, 1654)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2436, 100, 1749)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2437, 100, 1776)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2438, 100, 1791)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2439, 100, 1792)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2440, 100, 1793)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2441, 100, 1794)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2442, 100, 1795)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2443, 100, 1796)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2444, 100, 1797)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2445, 100, 1798)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2446, 100, 1799)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2447, 100, 1800)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2448, 100, 1801)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2449, 100, 1802)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2450, 100, 1803)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2451, 100, 1804)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2452, 100, 1805)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2453, 100, 1806)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2454, 100, 1807)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2455, 100, 1808)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2456, 100, 1809)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2457, 100, 1810)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2458, 100, 1811)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2459, 100, 1812)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2460, 100, 1813)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2461, 100, 1814)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2462, 100, 1815)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2463, 100, 1816)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2464, 100, 1817)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2465, 100, 1818)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2466, 100, 1819)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2467, 100, 1820)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2468, 100, 1821)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2469, 100, 1822)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2470, 100, 1823)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2471, 100, 1824)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2472, 100, 1825)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2473, 100, 1826)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2474, 100, 1827)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2475, 100, 1828)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2476, 100, 1829)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2477, 100, 1830)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2478, 100, 1831)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2479, 100, 1832)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2480, 100, 1833)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2481, 100, 1834)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2482, 100, 1835)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2483, 100, 1836)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2484, 100, 1837)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2485, 100, 1838)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2486, 100, 1839)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2487, 100, 1840)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2488, 100, 1841)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2489, 100, 1842)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2490, 100, 1843)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2491, 100, 1844)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2492, 100, 1845)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2493, 100, 1846)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2494, 100, 1847)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2495, 100, 1848)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2496, 100, 1849)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2497, 100, 1850)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2498, 100, 1851)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2499, 100, 1852)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2500, 100, 1853)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2501, 100, 1854)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2502, 100, 1855)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2503, 100, 1856)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2504, 100, 1857)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2505, 100, 1858)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2506, 100, 1859)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2507, 100, 1860)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2508, 100, 1861)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2509, 100, 1862)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2510, 100, 1863)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2511, 100, 1864)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2512, 100, 1865)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2513, 100, 1866)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2514, 100, 1867)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2515, 100, 1868)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2516, 100, 1869)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2517, 100, 1870)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2518, 100, 1871)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2519, 100, 1872)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2520, 100, 1873)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2521, 100, 1874)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2522, 100, 1875)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2523, 100, 1876)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2524, 100, 1877)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2525, 100, 1878)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2526, 100, 1879)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2527, 100, 1880)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2528, 100, 1881)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2529, 100, 1882)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2530, 100, 1883)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2531, 100, 1884)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2532, 100, 1885)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2533, 100, 1886)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2534, 100, 1887)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2535, 100, 1888)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2536, 100, 1889)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2537, 100, 1890)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2538, 100, 1891)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2539, 100, 1892)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2540, 100, 1893)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2541, 100, 1894)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2542, 100, 1895)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2543, 100, 1896)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2544, 100, 1897)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2545, 100, 1898)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2546, 100, 1899)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2547, 100, 1900)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2548, 100, 1901)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2549, 100, 1902)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2550, 100, 1903)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2551, 100, 1904)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2552, 100, 1905)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2553, 100, 1906)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2554, 100, 1907)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2555, 100, 1908)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2556, 100, 1909)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2557, 100, 1910)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2558, 100, 1911)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2559, 100, 1912)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2560, 100, 1913)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2561, 100, 1930)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2562, 100, 1953)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2563, 100, 1966)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2564, 100, 1969)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2565, 100, 1982)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2566, 100, 1986)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2567, 100, 1998)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2568, 100, 2006)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2569, 100, 2017)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2570, 100, 2061)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2571, 100, 2171)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2572, 100, 2267)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2573, 100, 2294)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2574, 100, 2419)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2575, 101, 110)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2576, 101, 524)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2577, 101, 609)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2578, 101, 700)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2579, 101, 914)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2580, 101, 941)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2581, 101, 942)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2582, 101, 971)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2583, 101, 1033)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2584, 101, 1055)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2585, 101, 1469)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2586, 101, 1470)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2587, 101, 1471)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2588, 101, 1472)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2589, 101, 1473)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2590, 101, 1474)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2591, 101, 1475)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2592, 101, 1476)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2593, 101, 1477)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2594, 101, 1478)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2595, 101, 1479)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2596, 101, 1480)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2597, 101, 1481)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2598, 101, 1482)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2599, 101, 1483)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2600, 101, 1484)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2601, 101, 1485)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2602, 101, 1486)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2603, 101, 1487)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2604, 101, 1488)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2605, 101, 1489)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2606, 101, 1490)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2607, 101, 1491)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2608, 101, 1492)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2609, 101, 1493)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2610, 101, 1494)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2611, 101, 1495)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2612, 101, 1496)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2613, 101, 1497)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2614, 101, 1498)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2615, 101, 1499)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2616, 101, 1500)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2617, 101, 1501)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2618, 101, 1502)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2619, 101, 1503)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2620, 101, 1504)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2621, 101, 1505)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2622, 101, 1506)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2623, 101, 1507)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2624, 101, 1508)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2625, 101, 1509)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2626, 101, 1510)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2627, 101, 1511)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2628, 101, 1512)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2629, 101, 1513)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2630, 101, 1514)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2631, 101, 1515)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2632, 101, 1516)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2633, 101, 1517)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2634, 101, 1518)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2635, 101, 1569)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2636, 101, 1875)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2637, 101, 2024)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2638, 101, 2108)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2639, 102, 70)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2640, 102, 104)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2641, 102, 114)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2642, 102, 143)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2643, 102, 188)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2644, 102, 193)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2645, 102, 221)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2646, 102, 233)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2647, 102, 343)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2648, 102, 370)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2649, 102, 371)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2650, 102, 396)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2651, 102, 497)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2652, 102, 518)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2653, 102, 519)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2654, 102, 520)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2655, 102, 521)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2656, 102, 522)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2657, 102, 523)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2658, 102, 524)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2659, 102, 525)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2660, 102, 526)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2661, 102, 527)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2662, 102, 528)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2663, 102, 529)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2664, 102, 530)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2665, 102, 531)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2666, 102, 532)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2667, 102, 533)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2668, 102, 534)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2669, 102, 535)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2670, 102, 536)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2671, 102, 537)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2672, 102, 538)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2673, 102, 539)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2674, 102, 540)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2675, 102, 541)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2676, 102, 542)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2677, 102, 543)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2678, 102, 544)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2679, 102, 545)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2680, 102, 546)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2681, 102, 547)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2682, 102, 548)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2683, 102, 549)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2684, 102, 550)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2685, 102, 551)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2686, 102, 552)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2687, 102, 553)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2688, 102, 554)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2689, 102, 555)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2690, 102, 556)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2691, 102, 557)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2692, 102, 558)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2693, 102, 559)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2694, 102, 560)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2695, 102, 561)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2696, 102, 562)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2697, 102, 563)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2698, 102, 564)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2699, 102, 565)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2700, 102, 566)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2701, 102, 567)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2702, 102, 568)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2703, 102, 569)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2704, 102, 570)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2705, 102, 571)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2706, 102, 572)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2707, 102, 573)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2708, 102, 574)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2709, 102, 575)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2710, 102, 576)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2711, 102, 577)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2712, 102, 578)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2713, 102, 579)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2714, 102, 580)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2715, 102, 581)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2716, 102, 582)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2717, 102, 583)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2718, 102, 584)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2719, 102, 585)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2720, 102, 586)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2721, 102, 587)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2722, 102, 588)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2723, 102, 590)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2724, 102, 591)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2725, 102, 592)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2726, 102, 593)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2727, 102, 594)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2728, 102, 595)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2729, 102, 596)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2730, 102, 597)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2731, 102, 598)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2732, 102, 599)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2733, 102, 600)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2734, 102, 601)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2735, 102, 602)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2736, 102, 604)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2737, 102, 605)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2738, 102, 606)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2739, 102, 607)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2740, 102, 608)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2741, 102, 609)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2742, 102, 641)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2743, 102, 740)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2744, 102, 819)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2745, 102, 948)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2746, 102, 959)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2747, 102, 970)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2748, 102, 974)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2749, 102, 1033)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2750, 102, 1127)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2751, 102, 1226)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2752, 102, 1241)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2753, 102, 1340)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2754, 102, 1341)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2755, 102, 1486)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2756, 102, 1488)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2757, 102, 1543)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2758, 102, 1659)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2759, 102, 1766)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2760, 102, 1780)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2761, 102, 1812)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2762, 102, 1864)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2763, 102, 1866)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2764, 102, 1944)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2765, 102, 2025)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2766, 102, 2108)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2767, 102, 2169)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2768, 102, 2410)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2769, 102, 2438)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2770, 103, 110)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2771, 103, 134)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2772, 103, 447)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2773, 103, 536)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2774, 103, 550)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2775, 103, 600)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2776, 103, 729)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2777, 103, 878)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2778, 103, 879)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2779, 103, 880)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2780, 103, 881)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2781, 103, 882)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2782, 103, 883)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2783, 103, 884)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2784, 103, 885)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2785, 103, 886)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2786, 103, 887)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2787, 103, 888)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2788, 103, 889)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2789, 103, 890)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2790, 103, 891)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2791, 103, 892)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2792, 103, 893)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2793, 103, 894)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2794, 103, 895)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2795, 103, 896)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2796, 103, 897)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2797, 103, 898)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2798, 103, 899)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2799, 103, 900)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2800, 103, 901)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2801, 103, 902)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2802, 103, 903)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2803, 103, 904)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2804, 103, 905)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2805, 103, 906)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2806, 103, 907)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2807, 103, 908)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2808, 103, 909)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2809, 103, 910)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2810, 103, 911)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2811, 103, 912)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2812, 103, 913)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2813, 103, 914)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2814, 103, 915)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2815, 103, 916)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2816, 103, 917)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2817, 103, 918)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2818, 103, 919)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2819, 103, 920)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2820, 103, 921)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2821, 103, 922)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2822, 103, 923)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2823, 103, 924)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2824, 103, 925)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2825, 103, 926)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2826, 103, 927)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2827, 103, 928)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2828, 103, 929)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2829, 103, 930)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2830, 103, 931)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2831, 103, 932)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2832, 103, 933)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2833, 103, 934)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2834, 103, 935)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2835, 103, 936)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2836, 103, 937)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2837, 103, 938)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2838, 103, 939)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2839, 103, 940)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2840, 103, 941)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2841, 103, 942)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2842, 103, 943)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2843, 103, 944)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2844, 103, 945)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2845, 103, 946)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2846, 103, 947)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2847, 103, 948)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2848, 103, 949)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2849, 103, 950)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2850, 103, 951)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2851, 103, 952)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2852, 103, 953)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2853, 103, 954)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2854, 103, 955)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2855, 103, 956)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2856, 103, 957)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2857, 103, 958)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2858, 103, 959)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2859, 103, 960)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2860, 103, 961)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2861, 103, 962)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2862, 103, 963)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2863, 103, 964)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2864, 103, 965)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2865, 103, 966)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2866, 103, 967)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2867, 103, 968)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2868, 103, 969)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2869, 103, 970)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2870, 103, 971)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2871, 103, 972)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2872, 103, 973)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2873, 103, 974)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2874, 103, 975)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2875, 103, 976)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2876, 103, 977)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2877, 103, 978)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2878, 103, 979)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2879, 103, 980)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2880, 103, 981)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2881, 103, 982)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2882, 103, 983)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2883, 103, 984)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2884, 103, 985)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2885, 103, 986)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2886, 103, 987)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2887, 103, 1121)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2888, 103, 1337)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2889, 103, 1392)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2890, 103, 1412)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2891, 103, 1434)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2892, 103, 1483)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2893, 103, 1487)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2894, 103, 1505)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2895, 103, 1512)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2896, 103, 1522)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2897, 103, 1539)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2898, 103, 1578)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2899, 103, 1594)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2900, 103, 1717)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2901, 103, 1751)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2902, 103, 1851)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2903, 103, 1887)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2904, 103, 2024)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2905, 103, 2357)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2906, 103, 2415)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2907, 104, 259)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2908, 104, 260)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2909, 104, 261)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2910, 104, 262)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2911, 104, 263)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2912, 104, 264)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2913, 104, 265)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2914, 104, 266)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2915, 104, 267)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2916, 104, 268)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2917, 104, 269)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2918, 104, 270)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2919, 104, 271)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2920, 104, 272)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2921, 104, 273)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2922, 104, 274)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2923, 104, 275)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2924, 104, 276)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2925, 104, 277)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2926, 104, 278)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2927, 104, 279)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2928, 104, 280)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2929, 104, 281)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2930, 104, 282)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2931, 104, 283)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2932, 104, 285)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2933, 104, 286)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2934, 104, 287)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2935, 104, 288)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2936, 104, 289)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2937, 104, 290)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2938, 104, 291)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2939, 104, 292)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2940, 104, 293)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2941, 104, 294)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2942, 104, 295)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2943, 104, 296)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2944, 104, 297)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2945, 104, 298)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2946, 104, 300)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2947, 104, 301)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2948, 104, 302)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2949, 104, 303)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2950, 104, 304)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2951, 104, 305)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2952, 104, 306)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2953, 104, 307)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2954, 104, 308)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2955, 104, 309)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2956, 104, 310)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2957, 104, 311)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2958, 104, 312)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2959, 104, 313)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2960, 104, 315)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2961, 104, 316)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2962, 104, 317)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2963, 104, 318)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2964, 104, 319)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2965, 104, 321)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2966, 104, 322)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2967, 104, 324)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2968, 104, 325)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2969, 104, 327)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2970, 104, 330)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2971, 104, 331)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2972, 104, 333)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2973, 104, 335)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2974, 104, 336)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2975, 104, 337)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2976, 104, 340)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2977, 104, 341)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2978, 104, 342)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2979, 104, 343)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2980, 104, 344)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2981, 104, 345)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2982, 104, 346)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2983, 104, 348)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2984, 104, 349)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2985, 104, 351)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2986, 104, 352)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2987, 104, 353)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2988, 104, 354)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2989, 104, 355)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2990, 104, 356)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2991, 104, 357)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2992, 104, 370)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2993, 104, 480)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2994, 104, 509)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2995, 104, 538)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2996, 104, 711)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2997, 104, 721)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2998, 104, 867)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (2999, 104, 1168)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3000, 104, 1192)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3001, 104, 1241)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3002, 104, 1397)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3003, 104, 1408)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3004, 104, 1426)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3005, 104, 1648)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3006, 104, 1699)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3007, 104, 1836)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3008, 104, 1858)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3009, 104, 1864)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3010, 104, 1910)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3011, 104, 1997)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3012, 104, 2281)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3013, 104, 2321)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3014, 104, 2463)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3015, 104, 2465)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3016, 48, 2469)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3017, 48, 2470)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3018, 48, 2471)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3019, 48, 2472)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3020, 48, 2473)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3021, 48, 2474)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3022, 48, 2475)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3023, 48, 2476)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3024, 48, 2477)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3025, 48, 2478)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3026, 48, 2479)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3027, 48, 2480)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3028, 48, 2481)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3029, 48, 2482)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3030, 48, 2484)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3031, 48, 2485)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3032, 48, 2486)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3033, 48, 2487)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3034, 48, 2488)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3035, 48, 2489)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3036, 48, 2490)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3037, 48, 2491)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3038, 48, 2492)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3039, 48, 2493)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3040, 48, 2494)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3041, 48, 2495)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3042, 48, 2496)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3043, 48, 2497)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3044, 48, 2498)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3045, 48, 2499)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3046, 48, 2501)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3047, 48, 2502)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3048, 48, 2503)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3049, 48, 2504)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3050, 48, 2505)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3051, 48, 2506)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3052, 48, 2507)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3053, 48, 2508)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3054, 48, 2509)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3055, 48, 2510)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3056, 48, 2511)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3057, 48, 2512)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3058, 48, 2513)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3059, 48, 2514)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3060, 48, 2515)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3061, 48, 2516)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3062, 48, 2517)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3063, 48, 2518)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3064, 48, 2519)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3065, 48, 2520)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3066, 48, 2521)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3067, 48, 2522)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3068, 48, 2523)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3069, 48, 2524)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3070, 48, 2525)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3071, 48, 2526)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3072, 48, 2527)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3073, 48, 2528)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3074, 48, 2529)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3075, 48, 2530)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3076, 48, 2531)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3077, 48, 2532)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3078, 48, 2533)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3079, 48, 2534)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3080, 48, 2535)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3081, 48, 2536)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3082, 48, 2537)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3083, 48, 2538)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3084, 48, 2539)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3085, 48, 2540)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3086, 48, 2541)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3087, 48, 2542)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3088, 48, 2543)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3089, 48, 2544)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3090, 48, 2545)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3091, 48, 2546)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3092, 48, 2547)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3093, 48, 2548)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3094, 48, 2549)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3095, 48, 2550)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3096, 48, 2551)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3097, 48, 2552)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3098, 48, 2553)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3099, 48, 2554)
GO
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3100, 48, 2555)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3101, 48, 2556)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3102, 48, 2558)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3103, 48, 2559)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3104, 48, 2560)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3105, 48, 2561)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3106, 48, 2562)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3107, 48, 2563)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3108, 48, 2564)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3109, 48, 2565)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3110, 48, 2566)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3111, 48, 2567)
INSERT [Relacion].[DP_Ciudad] ([id_dp_ciudad], [id_division_politica], [id_ciudad]) VALUES (3112, 123, 53)
SET IDENTITY_INSERT [Relacion].[DP_Ciudad] OFF
GO
SET IDENTITY_INSERT [Relacion].[Ingrediente_Stock] ON 

INSERT [Relacion].[Ingrediente_Stock] ([id_ingrediente_stock], [id_ingrediente], [id_stock], [cantidad]) VALUES (1, 1, 1, 25)
INSERT [Relacion].[Ingrediente_Stock] ([id_ingrediente_stock], [id_ingrediente], [id_stock], [cantidad]) VALUES (2, 2, 1, 40)
INSERT [Relacion].[Ingrediente_Stock] ([id_ingrediente_stock], [id_ingrediente], [id_stock], [cantidad]) VALUES (3, 2, 1, 40)
SET IDENTITY_INSERT [Relacion].[Ingrediente_Stock] OFF
GO
SET IDENTITY_INSERT [Relacion].[Lote_Ingrediente] ON 

INSERT [Relacion].[Lote_Ingrediente] ([id_batch_ingrediente], [id_batch], [id_ingrediente]) VALUES (1, 1, 1)
INSERT [Relacion].[Lote_Ingrediente] ([id_batch_ingrediente], [id_batch], [id_ingrediente]) VALUES (2, 2, 2)
INSERT [Relacion].[Lote_Ingrediente] ([id_batch_ingrediente], [id_batch], [id_ingrediente]) VALUES (3, 3, 3)
INSERT [Relacion].[Lote_Ingrediente] ([id_batch_ingrediente], [id_batch], [id_ingrediente]) VALUES (4, 9, 6)
INSERT [Relacion].[Lote_Ingrediente] ([id_batch_ingrediente], [id_batch], [id_ingrediente]) VALUES (5, 8, 4)
SET IDENTITY_INSERT [Relacion].[Lote_Ingrediente] OFF
GO
SET IDENTITY_INSERT [Relacion].[Lote_Stock] ON 

INSERT [Relacion].[Lote_Stock] ([id_lote_stock], [id_batch], [id_stock], [fecha_impacto], [cantidad]) VALUES (1, 1, 1, CAST(N'2023-08-28' AS Date), 2500)
INSERT [Relacion].[Lote_Stock] ([id_lote_stock], [id_batch], [id_stock], [fecha_impacto], [cantidad]) VALUES (2, 1, 2, CAST(N'2023-08-28' AS Date), 2500)
INSERT [Relacion].[Lote_Stock] ([id_lote_stock], [id_batch], [id_stock], [fecha_impacto], [cantidad]) VALUES (3, 2, 3, CAST(N'2023-08-28' AS Date), 2500)
INSERT [Relacion].[Lote_Stock] ([id_lote_stock], [id_batch], [id_stock], [fecha_impacto], [cantidad]) VALUES (4, 2, 4, CAST(N'2023-08-28' AS Date), 2500)
INSERT [Relacion].[Lote_Stock] ([id_lote_stock], [id_batch], [id_stock], [fecha_impacto], [cantidad]) VALUES (5, 3, 11, CAST(N'2023-08-28' AS Date), 2500)
INSERT [Relacion].[Lote_Stock] ([id_lote_stock], [id_batch], [id_stock], [fecha_impacto], [cantidad]) VALUES (6, 3, 12, CAST(N'2023-08-28' AS Date), 2500)
INSERT [Relacion].[Lote_Stock] ([id_lote_stock], [id_batch], [id_stock], [fecha_impacto], [cantidad]) VALUES (7, 4, 5, CAST(N'2023-08-28' AS Date), 5000)
INSERT [Relacion].[Lote_Stock] ([id_lote_stock], [id_batch], [id_stock], [fecha_impacto], [cantidad]) VALUES (8, 5, 6, CAST(N'2023-08-28' AS Date), 5000)
INSERT [Relacion].[Lote_Stock] ([id_lote_stock], [id_batch], [id_stock], [fecha_impacto], [cantidad]) VALUES (9, 6, 13, CAST(N'2023-08-28' AS Date), 5000)
INSERT [Relacion].[Lote_Stock] ([id_lote_stock], [id_batch], [id_stock], [fecha_impacto], [cantidad]) VALUES (10, 7, 14, CAST(N'2023-08-28' AS Date), 5000)
INSERT [Relacion].[Lote_Stock] ([id_lote_stock], [id_batch], [id_stock], [fecha_impacto], [cantidad]) VALUES (11, 8, 15, CAST(N'2023-08-28' AS Date), 5000)
INSERT [Relacion].[Lote_Stock] ([id_lote_stock], [id_batch], [id_stock], [fecha_impacto], [cantidad]) VALUES (12, 10, 8, CAST(N'2023-08-28' AS Date), 6000)
INSERT [Relacion].[Lote_Stock] ([id_lote_stock], [id_batch], [id_stock], [fecha_impacto], [cantidad]) VALUES (13, 9, 7, CAST(N'2023-08-28' AS Date), 6000)
INSERT [Relacion].[Lote_Stock] ([id_lote_stock], [id_batch], [id_stock], [fecha_impacto], [cantidad]) VALUES (14, 12, 17, CAST(N'2023-08-28' AS Date), 7500)
INSERT [Relacion].[Lote_Stock] ([id_lote_stock], [id_batch], [id_stock], [fecha_impacto], [cantidad]) VALUES (15, 11, 16, CAST(N'2023-08-28' AS Date), 7500)
SET IDENTITY_INSERT [Relacion].[Lote_Stock] OFF
GO
SET IDENTITY_INSERT [Relacion].[Medio_Pago_Orden_Compra] ON 

INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (1, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (3, 1, 3)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (4, 1, 4)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (5, 1, 5)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (6, 1, 6)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7, 1, 7)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (8, 1, 8)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (9, 1, 9)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (10, 1, 10)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (11, 1, 11)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (12, 1, 12)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (13, 1, 13)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (14, 1, 14)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (15, 1, 15)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (16, 1, 16)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (17, 1, 17)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (18, 1, 18)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (19, 4, 19)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (20, 2, 20)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (21, 1, 21)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (22, 1, 22)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (23, 1, 23)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (24, 1, 24)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (25, 1, 25)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (26, 1, 26)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (27, 1, 27)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (28, 1, 28)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (29, 1, 29)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (30, 1, 30)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (31, 1, 31)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (32, 1, 32)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (33, 1, 33)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (34, 1, 34)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (35, 1, 35)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (36, 1, 36)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (37, 1, 37)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (38, 1, 38)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (39, 1, 39)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (40, 1, 40)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (41, 1, 41)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (42, 1, 42)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (43, 1, 43)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (44, 1, 44)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (45, 1, 45)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (46, 1, 46)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (47, 1, 47)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (48, 1, 48)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (49, 1, 49)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (50, 1, 50)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (51, 1, 51)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (52, 1, 52)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (53, 1, 53)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (54, 1, 54)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (55, 1, 55)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (56, 1, 56)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (57, 1, 57)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (58, 1, 58)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (59, 1, 59)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (60, 1, 60)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (61, 1, 61)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (62, 1, 62)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (63, 1, 63)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (64, 1, 64)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (65, 1, 65)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (66, 1, 66)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (67, 1, 67)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (68, 1, 68)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (69, 1, 69)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (70, 1, 70)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (71, 1, 71)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (72, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (73, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (74, 1, 3)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (75, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (76, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (77, 1, 3)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (78, 1, 4)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (79, 1, 5)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (80, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (81, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (82, 1, 3)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (83, 1, 4)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (84, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (85, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (86, 1, 3)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (87, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (88, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (89, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (90, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (91, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (92, 1, 3)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (93, 1, 4)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (94, 1, 5)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (95, 1, 6)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (96, 1, 7)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (97, 1, 8)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (98, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (99, 1, 2)
GO
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (100, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (101, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (102, 1, 3)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (103, 1, 4)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (104, 1, 5)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (105, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (106, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (107, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (108, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (109, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (110, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (111, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (112, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (113, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (114, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (115, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (116, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (117, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (118, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (119, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (120, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (121, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (122, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (123, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (124, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (125, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (126, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (127, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (128, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (129, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (130, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (131, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (132, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (133, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (134, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (135, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (136, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (137, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (138, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (139, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (140, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (141, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (142, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (143, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (144, 1, 3)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (1110, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (1111, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (1112, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (1113, 1, 3)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (1114, 1, 4)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (1115, 1, 5)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (1116, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (1117, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (1118, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (1119, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (1120, 1, 3)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2114, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2115, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2116, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2117, 1, 3)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2118, 1, 4)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2119, 1, 5)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2120, 1, 6)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2121, 1, 7)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2122, 1, 8)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2123, 1, 9)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2124, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2125, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2126, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2127, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2128, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2129, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2130, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2131, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2132, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2133, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2134, 1, 3)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2135, 1, 4)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2136, 1, 5)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2137, 1, 6)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2138, 1, 7)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2139, 1, 8)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2140, 1, 9)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2141, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2142, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2143, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2144, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2145, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2146, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2147, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2148, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2149, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2150, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2151, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2152, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2153, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2154, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2155, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2156, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2157, 1, 1)
GO
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2158, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2159, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2160, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2161, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2162, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2163, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2164, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2165, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2166, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2167, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2168, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2169, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2170, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2171, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2172, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2173, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2174, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2175, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2176, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2177, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2178, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (2179, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (3163, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (3164, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (3165, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (3166, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (3167, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (3168, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (3169, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (3170, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (3171, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (3172, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (3173, 1, 3)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (3174, 1, 4)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (3175, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (3176, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (3177, 1, 3)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (3178, 1, 4)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (4163, 1, 1002)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (4164, 1, 1003)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (4165, 1, 1004)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (5163, 1, 2002)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (5164, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (6163, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (6164, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (6165, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (6166, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (6167, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (6168, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (6169, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (6170, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (6171, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (6172, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (6173, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (6174, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (6175, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (6176, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (6177, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (6178, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7163, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7164, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7165, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7166, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7167, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7168, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7169, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7170, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7171, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7172, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7173, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7174, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7175, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7176, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7177, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7178, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7179, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7180, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7181, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7182, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7183, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7184, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7185, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7186, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7187, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7188, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7189, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7190, 1, 3)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7191, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7192, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7193, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7194, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7195, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7196, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7197, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7198, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7199, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (7200, 1, 3)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (8172, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (8173, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (8174, 1, 3)
GO
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (8175, 1, 4)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (8176, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (8177, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (8178, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (8179, 1, 1)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (8180, 1, 2)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (8181, 1, 3)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (8182, 1, 4)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (8183, 1, 5)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (8184, 1, 6)
INSERT [Relacion].[Medio_Pago_Orden_Compra] ([id_medio_pago_orden_compra], [id_medio_pago], [id_orden_compra]) VALUES (8185, 1, 7)
SET IDENTITY_INSERT [Relacion].[Medio_Pago_Orden_Compra] OFF
GO
SET IDENTITY_INSERT [Relacion].[Moneda_Orden_Compra] ON 

INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (1, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (3, 3, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (4, 4, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (5, 5, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (6, 6, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7, 7, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (8, 8, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (9, 9, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (10, 10, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (11, 11, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (12, 12, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (13, 13, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (14, 14, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (15, 15, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (16, 16, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (17, 17, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (18, 18, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (19, 19, 4)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (20, 20, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (21, 21, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (22, 22, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (23, 23, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (24, 24, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (25, 25, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (26, 26, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (27, 27, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (28, 28, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (29, 29, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (30, 30, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (31, 31, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (32, 32, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (33, 33, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (34, 34, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (35, 35, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (36, 36, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (37, 37, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (38, 38, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (39, 39, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (40, 40, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (41, 41, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (42, 42, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (43, 43, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (44, 44, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (45, 45, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (46, 46, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (47, 47, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (48, 48, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (49, 49, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (50, 50, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (51, 51, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (52, 52, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (53, 53, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (54, 54, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (55, 55, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (56, 56, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (57, 57, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (58, 58, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (59, 59, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (60, 60, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (61, 61, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (62, 62, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (63, 63, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (64, 64, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (65, 65, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (66, 66, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (67, 67, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (68, 68, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (69, 69, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (70, 70, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (71, 71, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (72, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (73, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (74, 3, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (75, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (76, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (77, 3, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (78, 4, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (79, 5, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (80, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (81, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (82, 3, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (83, 4, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (84, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (85, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (86, 3, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (87, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (88, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (89, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (90, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (91, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (92, 3, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (93, 4, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (94, 5, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (95, 6, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (96, 7, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (97, 8, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (98, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (99, 2, 1)
GO
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (100, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (101, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (102, 3, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (103, 4, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (104, 5, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (105, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (106, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (107, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (108, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (109, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (110, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (111, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (112, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (113, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (114, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (115, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (116, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (117, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (118, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (119, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (120, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (121, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (122, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (123, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (124, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (125, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (126, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (127, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (128, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (129, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (130, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (131, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (132, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (133, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (134, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (135, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (136, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (137, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (138, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (139, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (140, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (141, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (142, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (143, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (144, 3, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (1110, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (1111, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (1112, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (1113, 3, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (1114, 4, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (1115, 5, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (1116, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (1117, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (1118, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (1119, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (1120, 3, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2114, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2115, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2116, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2117, 3, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2118, 4, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2119, 5, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2120, 6, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2121, 7, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2122, 8, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2123, 9, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2124, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2125, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2126, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2127, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2128, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2129, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2130, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2131, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2132, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2133, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2134, 3, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2135, 4, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2136, 5, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2137, 6, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2138, 7, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2139, 8, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2140, 9, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2141, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2142, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2143, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2144, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2145, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2146, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2147, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2148, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2149, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2150, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2151, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2152, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2153, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2154, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2155, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2156, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2157, 1, 1)
GO
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2158, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2159, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2160, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2161, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2162, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2163, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2164, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2165, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2166, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2167, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2168, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2169, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2170, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2171, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2172, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2173, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2174, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2175, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2176, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2177, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2178, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (2179, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (3163, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (3164, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (3165, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (3166, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (3167, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (3168, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (3169, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (3170, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (3171, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (3172, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (3173, 3, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (3174, 4, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (3175, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (3176, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (3177, 3, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (3178, 4, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (4163, 1002, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (4164, 1003, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (4165, 1004, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (5163, 2002, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (5164, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (6163, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (6164, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (6165, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (6166, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (6167, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (6168, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (6169, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (6170, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (6171, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (6172, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (6173, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (6174, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (6175, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (6176, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (6177, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (6178, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7163, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7164, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7165, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7166, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7167, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7168, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7169, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7170, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7171, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7172, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7173, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7174, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7175, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7176, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7177, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7178, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7179, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7180, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7181, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7182, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7183, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7184, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7185, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7186, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7187, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7188, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7189, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7190, 3, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7191, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7192, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7193, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7194, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7195, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7196, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7197, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7198, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7199, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (7200, 3, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (8172, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (8173, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (8174, 3, 1)
GO
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (8175, 4, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (8176, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (8177, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (8178, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (8179, 1, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (8180, 2, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (8181, 3, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (8182, 4, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (8183, 5, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (8184, 6, 1)
INSERT [Relacion].[Moneda_Orden_Compra] ([id_moneda_orden_compra], [id_orden_compra], [id_moneda]) VALUES (8185, 7, 1)
SET IDENTITY_INSERT [Relacion].[Moneda_Orden_Compra] OFF
GO
SET IDENTITY_INSERT [Relacion].[OC_Producto_Empaque] ON 

INSERT [Relacion].[OC_Producto_Empaque] ([id_ocproducto_empaque], [id_ocompra_producto], [id_empaque], [capacidad_envase]) VALUES (1, 1, 1, 25)
INSERT [Relacion].[OC_Producto_Empaque] ([id_ocproducto_empaque], [id_ocompra_producto], [id_empaque], [capacidad_envase]) VALUES (2, 2, 1, 25)
INSERT [Relacion].[OC_Producto_Empaque] ([id_ocproducto_empaque], [id_ocompra_producto], [id_empaque], [capacidad_envase]) VALUES (3, 3, 1, 25)
INSERT [Relacion].[OC_Producto_Empaque] ([id_ocproducto_empaque], [id_ocompra_producto], [id_empaque], [capacidad_envase]) VALUES (4, 4, 1, 25)
SET IDENTITY_INSERT [Relacion].[OC_Producto_Empaque] OFF
GO
SET IDENTITY_INSERT [Relacion].[OC_Producto_Medida] ON 

INSERT [Relacion].[OC_Producto_Medida] ([id_oc_producto_medida], [id_ocompra_producto], [id_medida]) VALUES (1, 1, 1)
INSERT [Relacion].[OC_Producto_Medida] ([id_oc_producto_medida], [id_ocompra_producto], [id_medida]) VALUES (2, 2, 1)
INSERT [Relacion].[OC_Producto_Medida] ([id_oc_producto_medida], [id_ocompra_producto], [id_medida]) VALUES (3, 3, 1)
INSERT [Relacion].[OC_Producto_Medida] ([id_oc_producto_medida], [id_ocompra_producto], [id_medida]) VALUES (4, 4, 1)
SET IDENTITY_INSERT [Relacion].[OC_Producto_Medida] OFF
GO
SET IDENTITY_INSERT [Relacion].[Orden_Compra_Envio] ON 

INSERT [Relacion].[Orden_Compra_Envio] ([id_orden_compra_envio], [id_envio], [id_orden_compra]) VALUES (1, 1, 1)
INSERT [Relacion].[Orden_Compra_Envio] ([id_orden_compra_envio], [id_envio], [id_orden_compra]) VALUES (2, 1, 2)
INSERT [Relacion].[Orden_Compra_Envio] ([id_orden_compra_envio], [id_envio], [id_orden_compra]) VALUES (3, 1, 3)
INSERT [Relacion].[Orden_Compra_Envio] ([id_orden_compra_envio], [id_envio], [id_orden_compra]) VALUES (4, 1, 4)
INSERT [Relacion].[Orden_Compra_Envio] ([id_orden_compra_envio], [id_envio], [id_orden_compra]) VALUES (5, 1, 5)
INSERT [Relacion].[Orden_Compra_Envio] ([id_orden_compra_envio], [id_envio], [id_orden_compra]) VALUES (6, 1, 6)
INSERT [Relacion].[Orden_Compra_Envio] ([id_orden_compra_envio], [id_envio], [id_orden_compra]) VALUES (7, 1, 7)
SET IDENTITY_INSERT [Relacion].[Orden_Compra_Envio] OFF
GO
SET IDENTITY_INSERT [Relacion].[Orden_Compra_Lote] ON 

INSERT [Relacion].[Orden_Compra_Lote] ([id_orden_compra_lote], [id_ocompra_producto], [id_lote]) VALUES (1, 1, 1)
INSERT [Relacion].[Orden_Compra_Lote] ([id_orden_compra_lote], [id_ocompra_producto], [id_lote]) VALUES (2, 1, 2)
INSERT [Relacion].[Orden_Compra_Lote] ([id_orden_compra_lote], [id_ocompra_producto], [id_lote]) VALUES (3, 1, 3)
INSERT [Relacion].[Orden_Compra_Lote] ([id_orden_compra_lote], [id_ocompra_producto], [id_lote]) VALUES (4, 2, 4)
INSERT [Relacion].[Orden_Compra_Lote] ([id_orden_compra_lote], [id_ocompra_producto], [id_lote]) VALUES (5, 2, 5)
INSERT [Relacion].[Orden_Compra_Lote] ([id_orden_compra_lote], [id_ocompra_producto], [id_lote]) VALUES (6, 2, 6)
INSERT [Relacion].[Orden_Compra_Lote] ([id_orden_compra_lote], [id_ocompra_producto], [id_lote]) VALUES (7, 2, 7)
INSERT [Relacion].[Orden_Compra_Lote] ([id_orden_compra_lote], [id_ocompra_producto], [id_lote]) VALUES (8, 2, 8)
INSERT [Relacion].[Orden_Compra_Lote] ([id_orden_compra_lote], [id_ocompra_producto], [id_lote]) VALUES (9, 3, 9)
INSERT [Relacion].[Orden_Compra_Lote] ([id_orden_compra_lote], [id_ocompra_producto], [id_lote]) VALUES (10, 3, 10)
INSERT [Relacion].[Orden_Compra_Lote] ([id_orden_compra_lote], [id_ocompra_producto], [id_lote]) VALUES (11, 4, 11)
INSERT [Relacion].[Orden_Compra_Lote] ([id_orden_compra_lote], [id_ocompra_producto], [id_lote]) VALUES (12, 4, 12)
SET IDENTITY_INSERT [Relacion].[Orden_Compra_Lote] OFF
GO
SET IDENTITY_INSERT [Relacion].[Pais_Ciudad] ON 

INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (1, 126, 1)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (2, 302, 2)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (3, 302, 3)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (4, 107, 4)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (5, 108, 5)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (6, 351, 6)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (7, 115, 7)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (8, 126, 8)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (9, 132, 9)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (10, 302, 10)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (11, 131, 11)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (12, 126, 12)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (13, 103, 13)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (14, 340, 14)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (15, 302, 15)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (16, 342, 16)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (17, 351, 17)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (18, 103, 18)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (19, 113, 19)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (20, 125, 20)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (21, 126, 21)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (22, 302, 22)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (23, 302, 23)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (24, 126, 24)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (25, 115, 25)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (26, 102, 26)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (27, 109, 27)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (28, 351, 28)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (29, 302, 29)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (30, 107, 30)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (31, 126, 31)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (32, 302, 32)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (33, 126, 33)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (34, 110, 34)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (35, 123, 35)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (36, 125, 36)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (37, 131, 37)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (38, 110, 38)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (39, 108, 39)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (40, 126, 40)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (41, 110, 41)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (42, 303, 42)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (43, 301, 43)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (44, 126, 44)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (45, 126, 45)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (46, 110, 46)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (47, 109, 47)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (48, 110, 48)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (49, 302, 49)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (50, 115, 50)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (51, 110, 51)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (52, 342, 52)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (53, 342, 53)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (54, 102, 54)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (55, 351, 55)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (56, 302, 56)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (57, 342, 57)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (58, 302, 58)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (59, 108, 59)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (60, 120, 60)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (61, 110, 61)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (62, 126, 62)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (63, 115, 63)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (64, 110, 64)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (65, 301, 65)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (66, 301, 66)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (67, 110, 67)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (68, 302, 68)
INSERT [Relacion].[Pais_Ciudad] ([id_pais_ciudad], [id_pais], [id_ciudad]) VALUES (69, 122, 69)
SET IDENTITY_INSERT [Relacion].[Pais_Ciudad] OFF
GO
SET IDENTITY_INSERT [Relacion].[Pais_Continente] ON 

INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (1, 102, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (2, 103, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (3, 104, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (4, 106, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (5, 107, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (6, 108, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (7, 109, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (8, 110, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (9, 111, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (10, 112, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (11, 113, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (12, 115, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (13, 117, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (14, 118, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (15, 121, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (16, 122, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (17, 123, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (18, 125, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (19, 126, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (20, 128, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (21, 131, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (22, 136, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (23, 141, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (24, 142, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (25, 143, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (26, 144, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (27, 147, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (28, 198, 1)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (29, 101, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (30, 114, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (31, 116, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (32, 119, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (33, 120, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (34, 124, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (35, 129, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (36, 130, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (37, 132, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (38, 135, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (39, 137, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (40, 138, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (41, 139, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (42, 145, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (43, 146, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (44, 148, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (45, 154, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (46, 156, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (47, 157, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (48, 158, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (49, 170, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (50, 171, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (51, 172, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (52, 173, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (53, 174, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (54, 175, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (55, 176, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (56, 177, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (57, 436, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (58, 199, 2)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (59, 201, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (60, 202, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (61, 203, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (62, 204, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (63, 205, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (64, 206, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (65, 207, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (66, 208, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (67, 209, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (68, 210, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (69, 211, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (70, 212, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (71, 213, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (72, 214, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (73, 215, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (74, 216, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (75, 217, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (76, 218, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (77, 219, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (78, 220, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (79, 221, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (80, 222, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (81, 223, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (82, 224, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (83, 225, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (84, 226, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (85, 227, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (86, 228, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (87, 229, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (88, 230, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (89, 231, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (90, 232, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (91, 233, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (92, 234, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (93, 235, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (94, 236, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (95, 237, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (96, 238, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (97, 239, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (98, 240, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (99, 241, 3)
GO
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (100, 242, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (101, 243, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (102, 244, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (103, 245, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (104, 246, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (105, 247, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (106, 248, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (107, 249, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (108, 250, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (109, 251, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (110, 252, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (111, 253, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (112, 260, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (113, 261, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (114, 262, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (115, 263, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (116, 299, 3)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (117, 301, 4)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (118, 302, 4)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (119, 303, 4)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (120, 370, 4)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (121, 371, 4)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (122, 396, 4)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (123, 310, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (124, 311, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (125, 312, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (126, 313, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (127, 314, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (128, 315, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (129, 316, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (130, 317, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (131, 318, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (132, 319, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (133, 320, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (134, 321, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (135, 322, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (136, 323, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (137, 324, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (138, 325, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (139, 326, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (140, 327, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (141, 328, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (142, 329, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (143, 380, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (144, 381, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (145, 382, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (146, 383, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (147, 384, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (148, 385, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (149, 386, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (150, 387, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (151, 388, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (152, 389, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (153, 390, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (154, 391, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (155, 392, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (156, 393, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (157, 398, 5)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (158, 340, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (159, 341, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (160, 342, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (161, 343, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (162, 344, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (163, 345, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (164, 346, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (165, 347, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (166, 348, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (167, 349, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (168, 350, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (169, 351, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (170, 394, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (171, 395, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (172, 399, 6)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (173, 401, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (174, 402, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (175, 403, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (176, 404, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (177, 405, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (178, 407, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (179, 408, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (180, 409, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (181, 410, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (182, 411, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (183, 412, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (184, 413, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (185, 414, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (186, 415, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (187, 416, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (188, 417, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (189, 418, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (190, 419, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (191, 420, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (192, 421, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (193, 422, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (194, 423, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (195, 424, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (196, 425, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (197, 426, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (198, 427, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (199, 430, 7)
GO
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (200, 431, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (201, 432, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (202, 433, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (203, 434, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (204, 435, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (205, 437, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (206, 439, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (207, 440, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (208, 441, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (209, 442, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (210, 443, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (211, 444, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (212, 445, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (213, 446, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (214, 447, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (215, 448, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (216, 449, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (217, 450, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (218, 453, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (219, 454, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (220, 455, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (221, 499, 7)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (222, 501, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (223, 502, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (224, 504, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (225, 505, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (226, 506, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (227, 507, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (228, 508, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (229, 509, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (230, 511, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (231, 512, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (232, 513, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (233, 515, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (234, 516, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (235, 517, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (236, 520, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (237, 521, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (238, 522, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (239, 523, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (240, 524, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (241, 525, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (242, 526, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (243, 527, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (244, 528, 8)
INSERT [Relacion].[Pais_Continente] ([id_pais_continente], [id_pais], [id_continente]) VALUES (245, 599, 8)
SET IDENTITY_INSERT [Relacion].[Pais_Continente] OFF
GO
SET IDENTITY_INSERT [Relacion].[Pais_DP] ON 

INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (1, 1, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (2, 2, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (3, 3, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (4, 4, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (5, 5, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (6, 6, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (7, 7, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (8, 8, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (9, 9, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (10, 10, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (11, 11, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (12, 12, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (13, 13, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (14, 14, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (15, 15, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (16, 16, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (17, 17, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (18, 18, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (19, 19, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (20, 20, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (21, 21, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (22, 22, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (23, 23, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (24, 24, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (25, 25, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (26, 26, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (27, 27, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (28, 28, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (29, 29, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (30, 30, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (31, 31, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (32, 32, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (33, 33, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (34, 34, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (35, 35, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (36, 36, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (37, 37, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (38, 38, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (39, 39, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (40, 40, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (41, 41, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (42, 42, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (43, 43, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (44, 44, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (45, 45, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (46, 46, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (47, 47, 108)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (48, 48, 340)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (49, 49, 340)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (50, 50, 340)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (51, 51, 340)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (52, 52, 340)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (53, 53, 340)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (54, 54, 340)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (55, 55, 340)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (56, 56, 340)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (57, 57, 340)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (58, 58, 340)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (59, 59, 340)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (60, 60, 340)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (61, 61, 340)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (62, 62, 340)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (63, 63, 340)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (64, 64, 340)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (65, 65, 340)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (66, 66, 340)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (67, 67, 340)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (68, 68, 340)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (69, 69, 340)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (70, 70, 340)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (71, 71, 340)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (72, 72, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (73, 73, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (74, 74, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (75, 75, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (76, 76, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (77, 77, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (78, 78, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (79, 79, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (80, 80, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (81, 81, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (82, 82, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (83, 83, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (84, 84, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (85, 85, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (86, 86, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (87, 87, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (88, 88, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (89, 89, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (90, 90, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (91, 91, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (92, 92, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (93, 93, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (94, 94, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (95, 95, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (96, 96, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (97, 97, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (98, 98, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (99, 99, 407)
GO
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (100, 100, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (101, 101, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (102, 102, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (103, 103, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (104, 104, 407)
INSERT [Relacion].[Pais_DP] ([id_pais_dp], [id_division_politica], [id_pais]) VALUES (105, 123, 342)
SET IDENTITY_INSERT [Relacion].[Pais_DP] OFF
GO
SET IDENTITY_INSERT [Relacion].[Perfil_Concepto] ON 

INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (1, 1, 2, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (2, 1, 16, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (3, 1, 20, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (4, 1, 21, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (5, 1, 22, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (6, 1, 5, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (7, 1, 6, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (8, 1, 7, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (9, 1, 10, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (1002, 2, 2, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (1003, 2, 16, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (1004, 2, 21, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (1005, 2, 20, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (1006, 2, 6, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (1007, 2, 7, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (1008, 2, 9, 4)
INSERT [Relacion].[Perfil_Concepto] ([id_perfil_concepto], [id_perfil_costo], [id_concepto_header], [enlace_concepto]) VALUES (1009, 2, 12, 4)
SET IDENTITY_INSERT [Relacion].[Perfil_Concepto] OFF
GO
INSERT [Relacion].[Producto_Receta] ([id_receta], [codigo_ingrediente_producto], [cantidad_percentil]) VALUES (1, N'FOS001', 65)
INSERT [Relacion].[Producto_Receta] ([id_receta], [codigo_ingrediente_producto], [cantidad_percentil]) VALUES (1, N'CIT005', 35)
GO
SET IDENTITY_INSERT [Relacion].[Proveedor_Ciudad] ON 

INSERT [Relacion].[Proveedor_Ciudad] ([id_proveedor_ciudad], [id_proveedor], [id_ciudad]) VALUES (1, 1, 53)
INSERT [Relacion].[Proveedor_Ciudad] ([id_proveedor_ciudad], [id_proveedor], [id_ciudad]) VALUES (3, 2, 2532)
INSERT [Relacion].[Proveedor_Ciudad] ([id_proveedor_ciudad], [id_proveedor], [id_ciudad]) VALUES (4, 3, 2515)
SET IDENTITY_INSERT [Relacion].[Proveedor_Ciudad] OFF
GO
SET IDENTITY_INSERT [Relacion].[Proveedor_OrdenCompra] ON 

INSERT [Relacion].[Proveedor_OrdenCompra] ([id_proveedor_OrdenCompra], [id_proveedor], [id_orden_compra]) VALUES (1, 1, 1)
INSERT [Relacion].[Proveedor_OrdenCompra] ([id_proveedor_OrdenCompra], [id_proveedor], [id_orden_compra]) VALUES (2, 1, 2)
INSERT [Relacion].[Proveedor_OrdenCompra] ([id_proveedor_OrdenCompra], [id_proveedor], [id_orden_compra]) VALUES (3, 1, 3)
INSERT [Relacion].[Proveedor_OrdenCompra] ([id_proveedor_OrdenCompra], [id_proveedor], [id_orden_compra]) VALUES (4, 1, 4)
INSERT [Relacion].[Proveedor_OrdenCompra] ([id_proveedor_OrdenCompra], [id_proveedor], [id_orden_compra]) VALUES (5, 1, 5)
INSERT [Relacion].[Proveedor_OrdenCompra] ([id_proveedor_OrdenCompra], [id_proveedor], [id_orden_compra]) VALUES (6, 1, 6)
INSERT [Relacion].[Proveedor_OrdenCompra] ([id_proveedor_OrdenCompra], [id_proveedor], [id_orden_compra]) VALUES (7, 1, 7)
SET IDENTITY_INSERT [Relacion].[Proveedor_OrdenCompra] OFF
GO
SET IDENTITY_INSERT [Relacion].[Usuario_Pass] ON 

INSERT [Relacion].[Usuario_Pass] ([id_usuario_pass], [id_usuario], [id_pass]) VALUES (1, 1, 1)
INSERT [Relacion].[Usuario_Pass] ([id_usuario_pass], [id_usuario], [id_pass]) VALUES (2, 1, 2)
SET IDENTITY_INSERT [Relacion].[Usuario_Pass] OFF
GO
SET IDENTITY_INSERT [Relacion].[Usuario_Perfil_Acceso] ON 

INSERT [Relacion].[Usuario_Perfil_Acceso] ([id_usuario_perfil], [id_usuario], [id_perfil], [id_acceso]) VALUES (1, 1, 1, 1)
INSERT [Relacion].[Usuario_Perfil_Acceso] ([id_usuario_perfil], [id_usuario], [id_perfil], [id_acceso]) VALUES (2, 1, 1, 2)
INSERT [Relacion].[Usuario_Perfil_Acceso] ([id_usuario_perfil], [id_usuario], [id_perfil], [id_acceso]) VALUES (3, 1, 2, 3)
INSERT [Relacion].[Usuario_Perfil_Acceso] ([id_usuario_perfil], [id_usuario], [id_perfil], [id_acceso]) VALUES (4, 1, 1, 4)
INSERT [Relacion].[Usuario_Perfil_Acceso] ([id_usuario_perfil], [id_usuario], [id_perfil], [id_acceso]) VALUES (5, 1, 1, 5)
INSERT [Relacion].[Usuario_Perfil_Acceso] ([id_usuario_perfil], [id_usuario], [id_perfil], [id_acceso]) VALUES (6, 1, 2, 6)
SET IDENTITY_INSERT [Relacion].[Usuario_Perfil_Acceso] OFF
GO
SET IDENTITY_INSERT [Sistema].[Acceso] ON 

INSERT [Sistema].[Acceso] ([id_acceso], [modulo]) VALUES (1, N'COMPRAS')
INSERT [Sistema].[Acceso] ([id_acceso], [modulo]) VALUES (2, N'DEPOSITO')
INSERT [Sistema].[Acceso] ([id_acceso], [modulo]) VALUES (3, N'LOGISTICA')
INSERT [Sistema].[Acceso] ([id_acceso], [modulo]) VALUES (4, N'PRODUCCION')
INSERT [Sistema].[Acceso] ([id_acceso], [modulo]) VALUES (5, N'VENTAS')
INSERT [Sistema].[Acceso] ([id_acceso], [modulo]) VALUES (6, N'ADMINISTRACION')
SET IDENTITY_INSERT [Sistema].[Acceso] OFF
GO
SET IDENTITY_INSERT [Sistema].[Ciudad] ON 

INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1, N'AACHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2, N'ALBUQUERQUE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (3, N'ANCHORAGE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (4, N'ÅRHUS')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (5, N'BARCELONA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (6, N'BARQUISIMETO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (7, N'BERGAMO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (8, N'BERLIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (9, N'BERN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (10, N'BOISE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (11, N'BRÄCKE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (12, N'BRANDENBURG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (13, N'BRUXELLES')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (14, N'BUENOS AIRES')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (15, N'BUTTE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (16, N'CAMPINAS')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (17, N'CARACAS')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (18, N'CHARLEROI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (19, N'CORK')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (20, N'COWES')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (21, N'CUNEWALDE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (22, N'ELGIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (23, N'EUGENE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (24, N'FRANKFURT A.M.')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (25, N'GENÈVE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (26, N'GRAZ')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (27, N'HELSINKI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (28, N'I. DE MARGARITA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (29, N'KIRKLAND')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (30, N'KOBENHAVN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (31, N'KÖLN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (32, N'LANDER')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (33, N'LEIPZIG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (34, N'LILLE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (35, N'LISBOA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (36, N'LONDON')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (37, N'LULEÅ')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (38, N'LYON')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (39, N'MADRID')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (40, N'MANNHEIM')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (41, N'MARSEILLE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (42, N'MÉXICO D.F.')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (43, N'MONTRÉAL')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (44, N'MÜNCHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (45, N'MÜNSTER')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (46, N'NANTES')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (47, N'OULU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (48, N'PARIS')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (49, N'PORTLAND')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (50, N'REGGIO EMILIA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (51, N'REIMS')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (52, N'RESENDE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (53, N'RIO DE JANEIRO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (54, N'SALZBURG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (55, N'SAN CRISTÓBAL')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (56, N'SAN FRANCISCO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (57, N'SAO PAULO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (58, N'SEATTLE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (59, N'SEVILLA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (60, N'STAVERN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (61, N'STRASBOURG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (62, N'STUTTGART')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (63, N'TORINO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (64, N'TOULOUSE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (65, N'TSAWASSEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (66, N'VANCOUVER')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (67, N'VERSAILLES')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (68, N'WALLA WALLA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (69, N'WARSZAWA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (70, N'FUYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (71, N'HEFEI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (72, N'LU’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (73, N'SUZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (74, N'BOZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (75, N'ANQING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (76, N'CHUZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (77, N'WUHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (78, N'BENGBU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (79, N'XUANZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (80, N'HUAINAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (81, N'MA’ANSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (82, N'HUAIBEI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (83, N'HUANGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (84, N'CHIZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (85, N'CHAOHUCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (86, N'WUSONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (87, N'WENCHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (88, N'TIANCHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (89, N'JIESHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (90, N'MINGGUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (91, N'MEICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (92, N'HELIXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (93, N'SUCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (94, N'SANJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (95, N'BEIJINGLU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (96, N'LIMINLU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (97, N'JINJIAZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (98, N'DUJI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (99, N'SUIXI')
GO
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (102, N'LONGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (104, N'LUCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (105, N'WUHE CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (106, N'TIANTANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (108, N'FUNAN CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (109, N'DIANBU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (110, N'FUYU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (111, N'QISHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (112, N'LIYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (113, N'SHANGPAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (114, N'RONGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (116, N'GAOHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (117, N'JINXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (118, N'SICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (119, N'TAIHE CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (120, N'HUICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (121, N'SHOUCHUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (122, N'LEIYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (123, N'GUZHEN CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (124, N'HUOQIU CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (125, N'DINGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (126, N'JINGCHUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (127, N'TAOZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (128, N'HUANFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (129, N'FENGYANG FUCHENGZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (130, N'JISHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (131, N'GUSHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (132, N'HAIYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (133, N'GANTANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (134, N'XIN’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (135, N'BIYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (136, N'WANZHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (137, N'JINGYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (138, N'DANGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (140, N'YAODU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (142, N'QILI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (143, N'LINGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (144, N'ZONGYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (145, N'MEISHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (146, N'WUCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (147, N'LIXIN CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (148, N'BEIJING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (149, N'CHANGPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (150, N'CHAOWAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (151, N'JINRONGJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (152, N'HAIDIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (153, N'GULOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (154, N'GONGCHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (155, N'DAYU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (156, N'CHENGBEI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (157, N'JINGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (158, N'XINGFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (159, N'BINHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (160, N'LUGU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (161, N'FENGTAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (162, N'LONGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (163, N'SHENGLI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (164, N'YANQING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (165, N'BEIYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (166, N'CHONGQING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (167, N'SANZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (168, N'YONG’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (169, N'NANJIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (170, N'LONGZHOUWAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (171, N'YANGJIAPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (172, N'XINSHANCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (173, N'DONGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (174, N'ZHONGSHANLU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (175, N'JIJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (176, N'CUNTAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (177, N'LIANGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (178, N'HANFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (179, N'ZHONGZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (180, N'GUIXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (181, N'WANSHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (182, N'GUNAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (183, N'ZITONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (184, N'TANGXIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (185, N'SANHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (186, N'ZHONGHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (187, N'CHENGXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (188, N'CHENGXIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (189, N'SHUANGFENGQIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (190, N'XIANGKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (191, N'GECHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (192, N'LIZHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (193, N'QUANZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (194, N'FUZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (195, N'ZHANGZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (196, N'XIAMEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (197, N'NINGDE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (198, N'PUTIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (199, N'NANPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (200, N'LONGYAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (201, N'SANMING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (202, N'QINGYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (203, N'XIMEICUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (204, N'FUQING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (205, N'SHISHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (206, N'FU’AN')
GO
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (207, N'FUDING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (208, N'JIAN’OU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (209, N'YONG’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (210, N'SHAOWU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (211, N'ZHANGPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (212, N'WUYISHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (213, N'CHANGTING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (214, N'YANPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (215, N'XINLUOQU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (216, N'DONGJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (217, N'GULOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (218, N'HANJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (219, N'FENGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (220, N'SHIMA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (221, N'FENGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (222, N'ANXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (223, N'YONGCHUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (224, N'YONGTAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (225, N'YUNLING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (226, N'NINGHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (227, N'LIANCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (228, N'ZHERONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (229, N'SUI’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (230, N'XIPU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (231, N'XIAOXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (232, N'WUPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (233, N'FENGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (234, N'XINZHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (235, N'DEHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (236, N'SHAXIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (237, N'MINHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (238, N'LUOCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (239, N'YOUXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (240, N'SONGYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (241, N'MINQING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (242, N'SHANCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (243, N'NANZHAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (244, N'AOYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (245, N'ZHOUNING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (246, N'DATIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (247, N'GUTIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (248, N'JIANGLE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (249, N'PUCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (250, N'SHUNCHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (251, N'GUANGZE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (252, N'HUAFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (253, N'SHANGHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (254, N'TAINING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (255, N'GUFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (256, N'MINGXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (257, N'QINGLIU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (258, N'JIANNING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (259, N'LANZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (260, N'QINCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (261, N'DINGXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (262, N'LONGBA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (263, N'QINBALING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (264, N'PINGLIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (265, N'WUWEI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (266, N'BAIYIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (267, N'ZHANGYE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (268, N'BEIDAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (269, N'XIBEIJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (270, N'JINCHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (271, N'HONGZHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (272, N'YINGMEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (273, N'LINXIA CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (274, N'JIAYUGUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (275, N'DONGHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (276, N'DUNHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (277, N'TAOYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (278, N'HEZUO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (279, N'WULAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (280, N'PAN’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (281, N'QINGQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (282, N'HUISHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (283, N'YITIAOSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (285, N'HUANIU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (286, N'YONGQING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (287, N'HUAZANGSI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (288, N'LIUJIAXIA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (289, N'LIUHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (290, N'SHAZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (291, N'YAOQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (292, N'XIHUACHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (293, N'ANYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (294, N'XIAGUANYING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (295, N'TUNZI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (296, N'BEIYA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (297, N'FUCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (298, N'ZAOJIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (300, N'SHETANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (301, N'SHIQIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (302, N'CHUIMATAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (303, N'SUONAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (304, N'HONGSHUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (305, N'YUANQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (306, N'DIANGA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (307, N'HONGLIUWAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (308, N'HONGWANSI')
GO
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (309, N'ZHANGYELU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (310, N'XIHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (311, N'NANJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (312, N'ANNING XILU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (313, N'FULILU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (315, N'DONGDAJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (316, N'NANJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (317, N'RENMINLU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (318, N'GANGU CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (319, N'XINGPINGLU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (321, N'JIUQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (322, N'HANYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (324, N'XINGGUO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (325, N'GUANGZHOULU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (327, N'HANJI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (330, N'ZHANGJIACHUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (331, N'LINTAN CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (333, N'HAISHIWAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (335, N'SHANHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (336, N'GAOTAI CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (337, N'GULANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (340, N'ZHOUQU CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (341, N'ZHONGHUALU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (342, N'XINNING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (343, N'QINGYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (344, N'PINGXIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (345, N'ZUITAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (346, N'LIULIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (348, N'JINPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (349, N'GAOLAN CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (351, N'SANLEI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (352, N'LABULENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (353, N'JINTA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (354, N'YUMEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (355, N'NYINMA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (356, N'DANGCHENGWAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (357, N'SHAHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (358, N'GUANGZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (359, N'SHENZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (360, N'DONGGUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (361, N'FOSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (362, N'ZHANJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (363, N'MAOMING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (364, N'JIEYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (365, N'SHANTOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (366, N'HUIZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (367, N'JIANGMEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (368, N'MEIZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (369, N'ZHAOQING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (370, N'QINGYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (371, N'ZHONGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (372, N'HEYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (373, N'SHAOGUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (374, N'SHANWEI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (375, N'CHAOZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (376, N'YANGJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (377, N'YUNFU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (378, N'PUNING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (379, N'ZHUHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (380, N'LIANJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (381, N'LEIZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (382, N'GAOZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (383, N'HUAZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (384, N'XINYI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (385, N'XINGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (386, N'YINGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (387, N'LUOCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (388, N'WUCHUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (389, N'TAISHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (390, N'YANGCHUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (391, N'CHANGSHA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (392, N'SIHUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (393, N'HESHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (394, N'ENCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (395, N'LECHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (396, N'LIANZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (397, N'DATANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (398, N'BIJIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (399, N'LONGJIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (400, N'TAISHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (401, N'TIANTOUJIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (402, N'ZHANLICUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (403, N'JINGGANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (404, N'CHAOSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (405, N'FENGYICUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (406, N'DONGSHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (407, N'XINTANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (408, N'SHIZHAOBI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (409, N'ZHANGMU TOUWEI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (410, N'NANQIAOTOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (411, N'LONGTIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (412, N'SHIYAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (413, N'SHUIXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (414, N'DONGSHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (415, N'YULU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (416, N'TANGJIA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (417, N'XISHANCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (418, N'MAZHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (419, N'FUGANGCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (420, N'HENGNAN')
GO
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (421, N'XIEGANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (422, N'NANXICUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (423, N'LONGKENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (424, N'LINGTANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (425, N'FENGGANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (426, N'XIANCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (427, N'QIANTANGCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (428, N'HESHANGTIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (429, N'HEYUNKENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (430, N'DUCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (431, N'XISHANCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (432, N'WUTIANCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (433, N'SHUIBIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (434, N'SHIJI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (435, N'YANGGAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (436, N'HENGBEI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (437, N'PUQIANCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (438, N'LONGKOUCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (439, N'JINSHA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (440, N'SHANGTANGCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (441, N'XIKENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (442, N'QIANWU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (443, N'CHINI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (444, N'SHIDONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (445, N'YANGMEI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (446, N'SHANKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (447, N'DONGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (448, N'YASHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (449, N'DAXIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (450, N'SHANGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (451, N'TANGJIA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (452, N'YUCHENGCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (453, N'JINKU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (454, N'SHUILOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (455, N'LIANTANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (456, N'YANGCUNZAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (457, N'TANXIA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (458, N'YANGTANGXU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (459, N'SANJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (460, N'DENGTANGCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (461, N'YAMEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (462, N'SHIJI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (463, N'FENGGUANGCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (464, N'SHAXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (465, N'XINPO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (466, N'BULICUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (467, N'PINGSHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (468, N'ZHENTANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (469, N'SHANGZHUANGCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (470, N'LIXINGCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (471, N'ZHAITANGCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (472, N'SHENTANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (473, N'HUANGXICUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (474, N'FENGRENXU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (475, N'SHIBANCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (476, N'GUOTANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (477, N'SHUANGTIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (478, N'CHIKAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (479, N'CHENGHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (480, N'SHIQIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (481, N'LEICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (482, N'CHENGNAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (483, N'SHAPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (484, N'JIEKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (485, N'XUCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (486, N'HAICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (487, N'SHUNDE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (488, N'DECHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (489, N'SHUIDONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (490, N'XINAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (491, N'TAIHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (492, N'GAOYAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (493, N'NAN’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (494, N'LIANJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (495, N'DONGZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (496, N'XINCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (497, N'LICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (498, N'LUOZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (499, N'JING’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (500, N'NANHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (501, N'HEXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (502, N'JIAOCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (503, N'LUOGANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (504, N'HUAICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (505, N'DAZHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (506, N'MEILU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (507, N'JIANGHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (508, N'SUICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (509, N'NANJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (510, N'DONGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (511, N'JIANGKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (512, N'HULIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (513, N'YUANSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (514, N'SHIJIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (515, N'RENHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (516, N'MEIXIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (517, N'ZHIZE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (518, N'NANNING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (519, N'YULIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (520, N'GUILIN')
GO
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (521, N'GUIGANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (522, N'HECHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (523, N'LIUZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (524, N'BAICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (525, N'HECHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (526, N'QINZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (527, N'WUZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (528, N'LAIBIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (529, N'CHONGZUO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (530, N'HEZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (531, N'BEIHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (532, N'GUIPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (533, N'HENGZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (534, N'CENCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (535, N'LICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (536, N'DONGXING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (537, N'LILAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (538, N'QINGYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (539, N'YINGYANGCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (540, N'LABU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (541, N'PINGNAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (542, N'LUCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (543, N'PUMIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (544, N'BOBAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (545, N'LINGCHUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (546, N'CHENGZHONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (547, N'SHINAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (548, N'RONGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (549, N'LINGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (550, N'XING’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (551, N'QUANZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (552, N'MENGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (553, N'QIAOXU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (554, N'YANGSHUO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (555, N'LONGXU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (556, N'CHENGXIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (557, N'TANTANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (558, N'MATOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (559, N'FUYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (560, N'PINGMA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (561, N'LUZHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (562, N'FUSUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (563, N'ZHONGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (564, N'LONGZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (565, N'DAHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (566, N'LIANZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (567, N'RONGSHUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (568, N'GUYI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (569, N'CHANG’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (570, N'ANYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (571, N'TENGZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (572, N'WUXUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (573, N'XIAOJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (574, N'SIYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (575, N'DAFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (576, N'DONGLAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (577, N'GONGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (578, N'PINGGUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (579, N'TIANZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (580, N'DABU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (581, N'PINGLE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (582, N'BABU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (583, N'BAMA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (584, N'LINGYUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (585, N'TIANDENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (586, N'XIANGZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (587, N'DONGMEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (588, N'GUANYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (590, N'LONGSHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (591, N'DEBAO CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (592, N'HUANJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (593, N'ZHAOPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (594, N'NANDAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (595, N'XINJING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (596, N'FENGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (597, N'TAOCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (598, N'YONGFU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (599, N'TIAN’E')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (600, N'XILIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (601, N'LEYE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (602, N'ZIYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (604, N'NAPO CHENGXIANGZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (605, N'LELI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (606, N'JINXIU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (607, N'LUXU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (608, N'JIANGZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (609, N'BAISHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (610, N'BIJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (611, N'ZUNYI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (612, N'GUIYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (613, N'TONGREN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (614, N'ANSHUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (615, N'SHUANGSHUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (616, N'XINGYI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (617, N'QIANXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (618, N'ZHONGSHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (619, N'DUYUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (620, N'QINGZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (621, N'XINGREN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (622, N'FUQUAN')
GO
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (623, N'CHISHUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (624, N'GUZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (625, N'XINZHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (626, N'YONGYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (627, N'HUAJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (628, N'BIANYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (629, N'WANGJIAZHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (630, N'XIAZHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (631, N'CHANGCHONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (632, N'CAIGUANTUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (633, N'BAIJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (634, N'BINGMEI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (635, N'YAOPU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (636, N'MACHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (637, N'LONGTANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (638, N'ZHONGBAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (639, N'JIAOZISHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (640, N'CHANGCHUNPU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (641, N'SIYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (642, N'DATANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (643, N'POMIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (644, N'BAIYAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (645, N'YANKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (646, N'DUANSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (647, N'XINMIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (648, N'XIAOBAZI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (649, N'ZHONGHECHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (650, N'LOUSHANGUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (651, N'ZHIJIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (652, N'HEPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (653, N'FENGYI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (654, N'LIAOGAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (655, N'HEZHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (656, N'YUXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (657, N'SANJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (658, N'DONGHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (659, N'DURU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (660, N'WANSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (661, N'HAIKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (662, N'NADA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (663, N'SANYA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (664, N'WANCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (665, N'WENCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (666, N'JIAJI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (667, N'BASUO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (668, N'JINJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (669, N'CHONGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (670, N'TUNCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (671, N'DINGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (672, N'CHENGBIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (673, N'CHANGTOUSHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (674, N'YINGGEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (675, N'YINGZHOU LINCHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (676, N'TANMEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (677, N'XINPO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (678, N'BENHAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (679, N'YELIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (680, N'BAOYOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (681, N'LINCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (682, N'SHILU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (683, N'BAOCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (684, N'YACHA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (685, N'BAODING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (686, N'SHIJIAZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (687, N'HANDAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (688, N'CANGZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (689, N'TANGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (690, N'HENGSHUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (691, N'LANGFANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (692, N'ZHANGJIAKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (693, N'CHENGDE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (694, N'QINHUANGDAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (695, N'DINGZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (696, N'RENQIU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (697, N'WU’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (698, N'HEJIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (699, N'ZUNHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (700, N'QIAN’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (701, N'SANHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (702, N'GAOBEIDIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (703, N'BAZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (704, N'XINJI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (705, N'XINGTAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (706, N'ZHUOZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (707, N'BOTOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (708, N'SHENZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (709, N'LUANZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (710, N'HUANGHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (711, N'SHAHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (712, N'NANGONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (714, N'ANGUO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (715, N'YANJIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (716, N'ZHENGDING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (717, N'ZHAOZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (718, N'JIZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (719, N'BAIGOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (720, N'GEXIANZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (721, N'YONGQING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (722, N'SHACHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (723, N'PINGQUAN')
GO
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (724, N'XIONGZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (725, N'FENGNING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (726, N'YI XIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (727, N'LAIYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (728, N'LESHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (729, N'LONGHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (730, N'LUANCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (731, N'WUYI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (732, N'KONGJIAZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (733, N'HUOLU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (734, N'FUNING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (735, N'XINGLONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (736, N'TONGYE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (737, N'CHAIGOUBU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (738, N'ZHUOLU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (739, N'FANZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (740, N'RONGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (741, N'WANZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (742, N'GUANGPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (743, N'ZANHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (744, N'KANGBAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (745, N'LINGSHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (746, N'MEIHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (747, N'LIANZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (748, N'ZENGCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (749, N'SUNSHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (750, N'GENGZHUANGQIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (751, N'SHICUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (752, N'CUI’ERZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (753, N'WANGGUANZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (754, N'SONGLINDIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (755, N'HUAISHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (756, N'DAYIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (757, N'XIELU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (758, N'XINGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (759, N'ZHANGJIAZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (760, N'HUAIYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (761, N'LONGWAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (762, N'DOUYU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (763, N'JIUZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (764, N'FANGCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (765, N'ZONGSHIZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (766, N'WOFOTANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (767, N'DONGLIZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (768, N'JIASHIZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (769, N'PANGKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (770, N'JITAICUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (771, N'WANGTAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (772, N'SHIMENZHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (773, N'YEHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (774, N'QIUTOUZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (775, N'FANGGUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (776, N'ANSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (777, N'DONGZHUOSU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (778, N'XINGJI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (779, N'LIUQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (780, N'BEIWANGLIZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (781, N'DAIJIAZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (782, N'QINGFENGDIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (783, N'JIAOHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (784, N'NANDAZHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (785, N'ZHANGCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (786, N'SHENJIATUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (787, N'DUSHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (788, N'LITIAN GEZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (789, N'NANBAISHEZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (790, N'WANCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (791, N'NANMENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (792, N'XINLEITOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (793, N'BAICHIGAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (794, N'GAOLINCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (795, N'TIEGAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (796, N'MATOUPU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (797, N'XINLIZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (798, N'NIUTUO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (799, N'YANGFANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (800, N'XIWANZI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (801, N'WEIBO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (802, N'TIANCHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (803, N'SUNGANDIANCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (804, N'SHIJIAZHUANGNAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (805, N'MONAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (806, N'XINQIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (807, N'DAJIECUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (808, N'ZUOJIAWU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (809, N'DAYING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (810, N'ANZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (811, N'DANIHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (812, N'YEJITUO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (813, N'XINDIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (814, N'ZHAOQIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (815, N'NANZHIQIU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (816, N'DOUZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (817, N'YIHEZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (818, N'DIAOWO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (819, N'MATOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (820, N'GUYING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (821, N'SONGCAOZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (822, N'CISHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (823, N'XINCHENG')
GO
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (824, N'SHALIUHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (825, N'HUANGZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (826, N'XIADIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (827, N'YINCHENGPU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (828, N'BEIXINZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (829, N'ZANGANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (830, N'JIMING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (831, N'TONGKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (832, N'DONGXIANPO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (833, N'SHAHEDIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (834, N'BEIDAYING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (835, N'DONGMAYING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (836, N'NANWUCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (837, N'XINZHAIDIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (838, N'YINGSHOUYINGZI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (839, N'NAN’AO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (840, N'YANGSHULING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (841, N'ZHANGGUZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (842, N'MATOUYING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (843, N'DUZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (844, N'SHANHAIGUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (845, N'CHENGZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (846, N'WEIXIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (847, N'FENGFENGKUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (848, N'YUTIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (849, N'KAIPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (850, N'DAMING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (851, N'BENCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (852, N'GUANTAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (853, N'SANGYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (854, N'SHE XIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (855, N'DONGHEGUMIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (856, N'MINGZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (857, N'DONGGUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (858, N'XICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (859, N'XINMATOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (860, N'JINGZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (861, N'LINXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (862, N'BEIDAIHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (863, N'DONGLUQIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (864, N'ZHANGBEI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (865, N'BEIJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (866, N'KUANCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (867, N'FUCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (868, N'NANPI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (869, N'QIANGEZHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (870, N'WEICHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (871, N'QINGLONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (872, N'DONGLIANG’ERZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (873, N'CHICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (874, N'GUYE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (875, N'CHENSAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (876, N'LUANPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (877, N'NIERONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (878, N'SUIHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (879, N'QIQIHAR')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (880, N'HARBIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (881, N'DAQING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (882, N'MUDANJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (883, N'JIAMUSI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (884, N'JIXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (885, N'HEIHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (886, N'SHUANGYASHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (887, N'YICHUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (888, N'HEGANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (889, N'ZHAODONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (890, N'TAIHECUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (891, N'HAILUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (892, N'NEHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (893, N'SHANGZHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (894, N'ANDA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (895, N'BEIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (896, N'FUJIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (897, N'NING’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (898, N'MISHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (899, N'HAILIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (900, N'TIELI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (901, N'WUDALIANCHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (902, N'BAMIANTONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (903, N'HONG’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (904, N'DONGNING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (905, N'SHUANGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (906, N'LIANHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (907, N'LONGJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (908, N'BOLI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (909, N'NENJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (910, N'LINKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (911, N'TAILAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (912, N'LANXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (913, N'KESHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (914, N'BAIQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (915, N'QINGGANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (916, N'SUIFENHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (917, N'GANNAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (918, N'SUILENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (919, N'XINQING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (920, N'QINGAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (921, N'HULIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (922, N'YIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (923, N'XINXING')
GO
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (924, N'ACHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (925, N'TIEXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (926, N'ZHANQIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (927, N'HONGQI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (928, N'BUKUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (929, N'XIN’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (930, N'NANHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (931, N'LONGHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (932, N'QIAONAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (933, N'JIANGUO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (934, N'YOUYI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (935, N'XIANGYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (936, N'FENDOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (937, N'FENDOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (938, N'XIANFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (939, N'YANGMING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (940, N'HONGJUNLU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (941, N'LISHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (942, N'GUANGMING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (943, N'WANGKUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (944, N'DONG’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (945, N'WUCHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (946, N'DONGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (947, N'FANGZHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (948, N'XING’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (949, N'TONGHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (950, N'GOUNAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (951, N'DATONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (952, N'MINGSHUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (953, N'HUANAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (954, N'YUELAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (955, N'MULAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (956, N'MEIXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (957, N'DAYOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (958, N'LINDIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (959, N'XILIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (960, N'BAYAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (961, N'WUMAHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (962, N'DAILING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (963, N'SUNWU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (964, N'BIANJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (965, N'YILAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (966, N'XURI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (967, N'HONGGANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (968, N'TAIKANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (969, N'BEISHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (970, N'DONGXING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (971, N'FUYU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (972, N'TANGYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (973, N'MEILISI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (974, N'XING’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (975, N'MASHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (976, N'KHUMA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (977, N'FENGXIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (978, N'FENDOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (979, N'CHAOYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (980, N'SHUGUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (981, N'YANSHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (982, N'HUZHONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (983, N'XINLIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (984, N'HONGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (985, N'YOUHAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (986, N'BINZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (987, N'XILINJI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (988, N'NANYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (989, N'ZHOUKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (990, N'ZHUMADIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (991, N'ZHENGZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (992, N'SHANGQIU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (993, N'XINYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (994, N'LUOYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (995, N'NANGANDAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (996, N'PINGDINGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (997, N'HUANGLONGSI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (998, N'JIANGGUANCHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (999, N'PUYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1000, N'JIAOZUO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1001, N'LUOHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1002, N'SANMENXIA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1003, N'HUAZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1004, N'HEBI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1005, N'YONGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1006, N'KAIYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1007, N'YINGCHUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1008, N'SHUIZHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1009, N'MEISHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1010, N'DENGTALU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1012, N'PUXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1013, N'ZIJINGLU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1014, N'QINGPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1015, N'XINHUALU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1016, N'CHENGGUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1017, N'SHUANGQIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1019, N'JIANSHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1020, N'SONGYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1021, N'PUYANG CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1022, N'SUOHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1023, N'CHENGJIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1024, N'TANBEI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1025, N'HUICHANG')
GO
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1026, N'YAKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1027, N'YIMA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1028, N'JIANSHELU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1029, N'ZHONGYUANLU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1030, N'GANHECHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1031, N'HUAIHELU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1032, N'ZHONGZHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1033, N'BAICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1034, N'LUYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1037, N'XINCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1038, N'CHONGYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1040, N'CHAOGE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1041, N'WUQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1043, N'DINGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1044, N'YANJIN CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1045, N'YANSHI CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1047, N'DAOKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1050, N'BISHUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1051, N'HUOJIA CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1052, N'JIYUANLU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1053, N'RUNING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1054, N'XIN’AN CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1055, N'YANJI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1057, N'DIZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1059, N'GUSHI CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1060, N'XIAYI CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1061, N'DAYING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1063, N'WEISHI CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1068, N'TONGXU CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1069, N'SHEDIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1071, N'GULÜ')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1073, N'ANLING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1074, N'QUYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1075, N'GUHUAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1077, N'FUGOU CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1078, N'DAQINGLU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1079, N'XIGUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1080, N'BINHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1081, N'ZHENYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1086, N'NANLE CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1088, N'KUNYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1089, N'HANCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1090, N'LANKAO CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1091, N'XINCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1092, N'ZISHUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1095, N'DONGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1099, N'WACHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1101, N'RUYANG CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1102, N'PANLONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1107, N'ZIJIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1108, N'XINJI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1109, N'LUSHI CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1110, N'HUAYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1112, N'YIYANG CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1113, N'MUCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1114, N'XIUWU CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1116, N'QINGHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1118, N'WENQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1119, N'WUHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1120, N'HUANGGANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1121, N'XIANGYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1122, N'XIAOGANZHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1123, N'XIAOXITA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1124, N'SHIYAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1125, N'HUANGSHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1126, N'JINGLING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1127, N'RONGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1128, N'XIANTAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1129, N'HANCHUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1130, N'EZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1131, N'ZHONGXIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1132, N'ZAOYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1133, N'LICHUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1134, N'DAYE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1135, N'MACHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1136, N'XINDI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1137, N'SONGZI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1138, N'GUANGSHUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1139, N'ANLU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1140, N'WUXUE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1141, N'XINSHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1142, N'XIULIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1143, N'DANGYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1144, N'SHASHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1145, N'YICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1146, N'ZHIJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1147, N'LAOHEKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1148, N'DANJIANGKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1149, N'JIANGJIAFAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1150, N'YIDU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1151, N'PUQI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1153, N'XILING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1154, N'ZHIFANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1155, N'WUJIASHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1157, N'CAIDIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1158, N'TIANCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1159, N'DAWU CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1160, N'QIANQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1161, N'HUANGPI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1163, N'DOUHUDI')
GO
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1165, N'ZHANGWAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1166, N'HUARONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1168, N'QINGQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1169, N'XIANGFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1170, N'MAOPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1172, N'SHAYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1173, N'HAOXUE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1174, N'DIANJUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1175, N'GULAOBEI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1176, N'WUXUE SHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1178, N'XIAODUCHUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1179, N'HUAYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1180, N'ZHUSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1181, N'JUANSHUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1182, N'MINGFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1183, N'HUANGMEI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1184, N'LISHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1185, N'GAOLESHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1186, N'YEZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1189, N'YUYUE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1190, N'TUANFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1191, N'WENQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1192, N'XINGGUO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1193, N'TONGYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1194, N'GUFU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1195, N'SONGBAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1196, N'XINLING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1197, N'FENGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1198, N'WUFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1199, N'CAOHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1200, N'ZHUXI CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1201, N'RONGMEI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1202, N'CHANGSHA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1203, N'SHAOYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1204, N'HENGYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1205, N'CHANGDE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1206, N'YONGZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1207, N'HUAIHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1208, N'CHENZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1209, N'YIYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1210, N'ZHUZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1211, N'LOUDI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1212, N'XIANGTAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1213, N'ZHANGJIAJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1214, N'YUTAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1215, N'LIANGSHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1216, N'GUANKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1217, N'LIANYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1218, N'LEIYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1219, N'XISHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1220, N'RONGJIAWAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1221, N'YIYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1222, N'XIANGXIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1223, N'WUGANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1224, N'MILUO CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1225, N'QIONGHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1226, N'CHANG’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1227, N'HONGJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1228, N'LENGSHUIJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1229, N'TANGDONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1230, N'QIANZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1231, N'JINSHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1232, N'ZHIJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1233, N'SHAOSHANZHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1234, N'TANGDUKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1235, N'DONGTUNDU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1236, N'DAMATOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1237, N'WENXING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1238, N'HESHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1239, N'DINGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1240, N'MIN’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1241, N'QINGYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1242, N'GUITANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1243, N'LIYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1244, N'FURONG BEILU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1246, N'TAOHUAJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1247, N'WANGYUE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1248, N'XINGSHA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1249, N'CHENYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1250, N'GAOTANGLING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1251, N'ANREN CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1252, N'YONGFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1253, N'LUFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1254, N'HONGQIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1255, N'BAIYASHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1256, N'NANZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1257, N'ANXIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1258, N'YISUHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1259, N'ZHANGJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1260, N'GAOCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1261, N'TAOHONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1262, N'LONGQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1263, N'HANSHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1264, N'DONGKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1267, N'LUKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1268, N'SHUNLING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1269, N'XIDU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1270, N'CHUJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1271, N'NIANGXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1274, N'LIULINZHOU')
GO
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1275, N'LINLI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1276, N'QIANLING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1277, N'HUAYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1278, N'TUOJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1279, N'YUNJI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1281, N'TAFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1282, N'LIYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1285, N'CILI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1286, N'LINGXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1287, N'HANCHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1288, N'YUANLING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1289, N'KAIYUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1290, N'WULINGYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1291, N'TUOJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1293, N'JIAHE CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1294, N'LINCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1295, N'QUYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1296, N'DONGPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1297, N'XINHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1298, N'GUYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1299, N'JINSHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1300, N'DAOJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1301, N'LINWU CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1302, N'CHANGPU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1303, N'XIAOPU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1304, N'LONGBO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1305, N'QIANCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1306, N'WUXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1307, N'RULIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1308, N'SHUANGJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1309, N'XIAYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1310, N'TONGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1311, N'NANJING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1312, N'NANTONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1313, N'YANCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1314, N'SUQIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1315, N'SUZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1316, N'TAIZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1317, N'HUAI’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1318, N'XINPU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1319, N'CHANGZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1320, N'WUXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1321, N'YANGZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1322, N'ZHENJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1323, N'SHUYANGZHA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1324, N'YUSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1325, N'CHANGSHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1326, N'PIZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1327, N'YANGSHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1328, N'RUCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1329, N'HUAIYIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1330, N'SHAOYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1331, N'JIANGYIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1332, N'YICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1333, N'TAIXING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1334, N'DONGTAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1335, N'DANYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1336, N'HUILONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1337, N'XIN’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1338, N'HAI’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1339, N'GAOYOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1340, N'LICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1341, N'CHENGXIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1342, N'JINGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1343, N'JURONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1344, N'ZHENZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1345, N'YINGZHONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1346, N'XIBANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1347, N'ZHOUJIAJING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1348, N'BINHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1349, N'WULAOCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1350, N'MEIYUAN XINCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1351, N'NANCHANSI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1352, N'PINGJIANGLU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1353, N'CHONG’ANSI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1354, N'BEIDAJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1355, N'SHUANGTA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1356, N'SHILU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1357, N'SHOUXIHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1358, N'WENHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1359, N'HEHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1360, N'QINHONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1361, N'XINDU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1362, N'HUTANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1363, N'HELIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1364, N'HUAYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1365, N'NINGNAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1366, N'YULONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1367, N'ZHENGDONGLU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1368, N'JIANGYAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1369, N'SONGLING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1370, N'SUICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1371, N'NIUSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1372, N'HAIMEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1373, N'HANSHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1374, N'JINSHA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1375, N'YISHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1376, N'CHUNXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1377, N'SONGLONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1378, N'YUNYANG')
GO
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1379, N'PEICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1380, N'FENGXIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1381, N'DAZHONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1382, N'XIONGZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1383, N'SHISHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1384, N'YUSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1385, N'HEDE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1386, N'GUYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1387, N'HONGMIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1388, N'QINGKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1389, N'JUEGANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1390, N'GANZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1391, N'SHANGRAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1392, N'YICHUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1393, N'NANCHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1394, N'JI’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1395, N'JIUJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1396, N'FUZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1397, N'PINGXIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1398, N'JINGDEZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1399, N'JIANGUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1400, N'YINGTAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1401, N'XINYU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1402, N'LEPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1403, N'GUIXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1404, N'RUIMING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1405, N'ZHANGSHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1406, N'PENCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1407, N'RONGJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1408, N'XINGGUO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1409, N'JIANCHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1410, N'ENJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1411, N'SHUANGZHONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1412, N'XURI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1413, N'YUANZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1414, N'NANKANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1415, N'CHANGNING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1416, N'AOYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1417, N'ZHAOXIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1418, N'LONGNAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1419, N'TUBU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1420, N'POYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1421, N'XIANGDONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1422, N'GONGJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1423, N'JIZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1424, N'CHENGJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1425, N'QUANJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1426, N'QINCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1427, N'SHANGLI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1428, N'MEIJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1429, N'JUNYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1430, N'PINGDU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1431, N'LONGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1432, N'QINTING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1433, N'DUNHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1434, N'DONGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1435, N'XUJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1436, N'CHENYING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1437, N'HEKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1438, N'JINCHUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1439, N'NAN’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1440, N'BASHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1441, N'WENFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1442, N'SHAHEJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1443, N'FENYI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1444, N'AOXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1445, N'LUXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1446, N'RIFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1447, N'QINJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1448, N'FENGGANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1449, N'KANGLE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1450, N'XIUGU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1451, N'HECHUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1452, N'JIADING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1453, N'LISHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1454, N'YONGNING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1455, N'HENGSHUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1456, N'YINING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1457, N'ZIYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1458, N'FENGCHUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1459, N'XIAPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1460, N'SHUANGXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1461, N'MEILIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1462, N'FURONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1463, N'XIANGHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1464, N'DUCHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1465, N'FULIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1466, N'PUTING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1467, N'SHUIBIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1468, N'HUICHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1469, N'CHANGCHUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1470, N'SIPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1471, N'JILIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1472, N'YUSHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1473, N'GONGZHULING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1474, N'DEHUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1475, N'SHULAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1476, N'MEIHEKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1477, N'PANSHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1478, N'YANJI')
GO
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1479, N'LIAOYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1480, N'DUNHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1481, N'HUADIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1482, N'MINZHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1483, N'GUANGMING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1484, N'ZHENGJIATUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1485, N'DALAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1486, N'BAICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1487, N'FUYU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1488, N'BAISHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1489, N'HUNCHUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1490, N'JI’AN SHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1491, N'JIUTAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1492, N'HEDONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1493, N'LONGJING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1494, N'LINJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1495, N'NONG’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1496, N'TUMEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1497, N'WANGQING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1498, N'LIUHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1499, N'HUINAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1500, N'CHANGLING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1501, N'KUAIDAMAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1502, N'HUNJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1503, N'MINGREN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1504, N'SUNJIA BUZI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1505, N'LISHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1506, N'CHANGBAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1507, N'MINGYUE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1508, N'SANCHAHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1509, N'FUSONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1510, N'YITONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1511, N'JINGYU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1512, N'BAIQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1513, N'ZHENLAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1514, N'DONGFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1515, N'KOUQIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1516, N'TONGYU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1517, N'QIANGUO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1518, N'QIAN’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1519, N'SHENYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1520, N'DALIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1521, N'ANSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1522, N'CHAOYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1523, N'JINZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1524, N'TIELING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1525, N'HULUDAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1526, N'LIANSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1527, N'DANDONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1528, N'YINGKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1529, N'FUSHUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1530, N'FUXIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1531, N'LIAOYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1532, N'BENXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1533, N'HAICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1534, N'WAFANGDIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1535, N'ZHUANGHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1536, N'DASHIQIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1537, N'GAIZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1538, N'XINMIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1539, N'XINXING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1540, N'LINGYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1541, N'XINGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1542, N'KAIYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1543, N'FENGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1544, N'BEINING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1545, N'LINGHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1546, N'BEIPIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1547, N'DENGTACUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1548, N'HUANREN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1549, N'SUIZHONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1550, N'CHANGTU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1551, N'DAWA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1552, N'KANGPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1553, N'LONGGANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1554, N'MIAODONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1555, N'BEIYINGZI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1556, N'TIEYINGZI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1557, N'NANPIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1558, N'BIANCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1559, N'YINCHUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1560, N'GUYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1561, N'WUZHONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1562, N'ZHONGWEI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1563, N'SIZHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1564, N'SHIZUISHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1565, N'DAXINCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1566, N'YANGHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1567, N'JINXING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1568, N'WANGYUANQIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1569, N'SANCHAHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1570, N'SHENGLI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1571, N'WANGTUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1572, N'ZHANGZHENGQIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1573, N'WANGHONG YIDUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1574, N'DONGTA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1575, N'SANHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1576, N'BEIJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1578, N'NING’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1579, N'BINHE')
GO
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1580, N'XIGANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1581, N'LONGDE CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1582, N'YUHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1583, N'BAIYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1584, N'XIANGSHUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1585, N'HUAMACHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1586, N'XINING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1587, N'GOLMUD')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1588, N'QIAOTOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1589, N'SHANGCHUANKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1590, N'LUSHAR')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1591, N'WEIYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1592, N'PING’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1593, N'QABQA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1594, N'BAYAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1595, N'HAOMEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1596, N'RONGWO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1597, N'JISHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1598, N'XANGDA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1599, N'ZIKETAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1600, N'GYÊGU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1601, N'YOUGANNING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1602, N'QAGAN US')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1603, N'MAGITANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1604, N'ZEQU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1605, N'XINYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1606, N'MANGQU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1607, N'XIREG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1608, N'SANJIAOCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1609, N'CHUQUNG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1610, N'PAGQÊN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1611, N'HEYIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1612, N'SÊRAITANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1613, N'CHUGQÊNSUMDO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1614, N'MACHALI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1616, N'HEXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1617, N'BABAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1618, N'GABASUMDO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1619, N'JIMAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1620, N'SAHUTENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1621, N'GYAIJÊPOZHANGGÊ')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1622, N'YUEGAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1623, N'DAWU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1624, N'SHALIUHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1625, N'XI’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1626, N'WEINAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1627, N'XIANYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1628, N'BAOJISHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1629, N'HANZHONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1630, N'YULINSHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1631, N'SHANGZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1632, N'YAN’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1633, N'ANKANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1634, N'TONGCHUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1635, N'HANCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1636, N'BINXIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1637, N'TONGCHUANSHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1638, N'HUAYIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1639, N'SHENMU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1640, N'FUGU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1641, N'DALI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1642, N'HENGKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1643, N'XINMIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1644, N'LONGMEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1645, N'GUOZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1646, N'YONGPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1647, N'YECUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1648, N'LIULIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1649, N'DACUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1650, N'SHANGZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1651, N'ZUITOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1652, N'LIANHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1653, N'WEIYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1654, N'XINCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1656, N'JINLING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1657, N'YANTA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1658, N'QINDU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1659, N'CHANG’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1660, N'BEILIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1662, N'YANLIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1663, N'ZHONGSHAN DONGLU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1664, N'GANTING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1666, N'YAOZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1667, N'ERQU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1668, N'LIQUAN CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1669, N'HUAZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1670, N'FUFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1671, N'WEICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1673, N'DOUCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1674, N'SHOUSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1675, N'LUYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1676, N'JINGGAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1677, N'JIANJUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1678, N'LANGUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1679, N'XIXIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1680, N'LINTONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1681, N'HANYIN CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1682, N'FENGMING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1684, N'CHUNHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1686, N'ZHAOREN')
GO
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1687, N'MIANYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1688, N'ZHANGJIAPAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1689, N'LANGAO CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1690, N'DINGBIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1691, N'XUNYI CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1692, N'JINGYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1693, N'ZIYANG CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1695, N'BAO’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1696, N'WUQI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1697, N'SHUANGSHIPU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1698, N'QIANYOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1699, N'HANYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1700, N'JIUCHENGGONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1701, N'YUANJIAZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1702, N'HANBIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1703, N'LIUBA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1705, N'NONGCHANGBALIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1706, N'LINYI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1707, N'WEIFANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1708, N'HEZE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1709, N'JINING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1710, N'JINAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1711, N'YANTAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1712, N'LIAOCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1713, N'QINGDAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1714, N'TAI’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1715, N'DEZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1716, N'ZIBO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1717, N'BINZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1718, N'ZAOZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1719, N'RIZHAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1720, N'WEIHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1721, N'SHENGLI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1722, N'CHENGTANGCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1723, N'PINGDU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1724, N'XINTAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1725, N'LAIWU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1726, N'MIZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1727, N'SHOUGUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1728, N'ANQIU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1729, N'FEICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1730, N'QINGZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1731, N'JIAOZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1732, N'LAIYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1733, N'GAOMI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1734, N'WEICHANGLU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1735, N'LAIXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1736, N'QINGNIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1737, N'ZOUPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1738, N'LELING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1739, N'YATOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1740, N'QUFU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1741, N'ZHUANGYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1742, N'KUIJU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1743, N'LUOFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1744, N'YUCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1745, N'YISHUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1746, N'PINGYI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1747, N'SHANCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1748, N'HUANCUILOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1749, N'QINGYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1750, N'GULOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1751, N'XIANGYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1752, N'DECHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1753, N'MUDAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1754, N'WENHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1755, N'NINGYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1756, N'JIAXIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1757, N'YANTA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1758, N'RIZHAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1759, N'LANSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1760, N'DENGZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1761, N'GAOTANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1762, N'CHENGWU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1763, N'WENSHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1764, N'NANCHANGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1765, N'JIYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1766, N'LINGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1767, N'JINXIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1768, N'RUSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1769, N'QIHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1770, N'JUYE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1771, N'XIAJIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1772, N'JUANCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1773, N'DINGTAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1774, N'XINJIA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1775, N'YANGYING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1776, N'YUNCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1777, N'TANCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1778, N'SHANGHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1779, N'GUANCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1780, N'LINGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1781, N'NANMA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1782, N'GUANGRAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1783, N'YANGXIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1784, N'WUCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1785, N'PINGYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1786, N'NINGJIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1787, N'TIANFU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1788, N'DONGPING')
GO
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1789, N'GUANGRAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1790, N'HEKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1791, N'YUNCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1792, N'LINFEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1793, N'TAIYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1794, N'CHANGZHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1795, N'XINZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1796, N'JINCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1797, N'XIPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1798, N'SHUOZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1799, N'YANGQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1800, N'YUCI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1801, N'YUANPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1802, N'GAOPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1803, N'XIAOYI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1804, N'YONGJI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1805, N'FENYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1806, N'JIEXIU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1807, N'HEJIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1808, N'YUNZHONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1809, N'HUOZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1810, N'GUJIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1811, N'DAHUAISHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1812, N'FENGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1813, N'WULING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1814, N'JINCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1815, N'HOUZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1816, N'YISHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1817, N'JINGPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1818, N'WEIFEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1819, N'LONGQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1820, N'LINQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1821, N'LEPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1822, N'TANGXING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1823, N'YAOFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1824, N'MINGXING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1825, N'XIEDIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1826, N'FANCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1827, N'DONGGUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1828, N'YINYING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1829, N'YUQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1830, N'HUQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1831, N'LECHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1832, N'SHIHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1833, N'DONGCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1834, N'XIEZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1835, N'LONGXING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1836, N'JINCHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1837, N'XINCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1838, N'QINHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1839, N'GUTAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1840, N'HOUBU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1841, N'ZHANGLIANGCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1842, N'LOUFAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1843, N'LINGQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1844, N'TAICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1845, N'LANYI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1846, N'DABUTOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1847, N'DAIYUE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1848, N'YANGQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1849, N'DONGGOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1850, N'ZHAOYU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1851, N'MASHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1852, N'DUANZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1853, N'HUANGZHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1854, N'LIUXIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1855, N'QIANFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1856, N'JULUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1857, N'XIAODIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1858, N'LIULIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1859, N'GUANSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1860, N'LONGQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1861, N'LIHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1862, N'DANZHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1863, N'GUHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1864, N'QINGYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1865, N'LUHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1866, N'FENGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1867, N'YONG’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1868, N'CUIFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1869, N'HANDIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1870, N'TIANNING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1871, N'SHANGGUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1872, N'CHAICUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1873, N'WENBI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1874, N'TONGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1875, N'LINJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1876, N'SHENGRENJIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1877, N'DINGCHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1878, N'JIFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1879, N'ECHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1880, N'JINYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1881, N'XINCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1882, N'NINGXIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1883, N'XIUSHUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1884, N'XINGUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1885, N'YONG’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1886, N'JICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1887, N'CHAOYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1888, N'YUNXING')
GO
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1889, N'FENGZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1890, N'NANCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1891, N'GUJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1892, N'TIANTAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1893, N'CHONGWEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1894, N'PUCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1895, N'JICHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1896, N'XINSHUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1897, N'YIXING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1898, N'LONGQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1899, N'LONGQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1900, N'FENGHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1901, N'LIAOYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1902, N'CHANGNING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1903, N'GEDONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1904, N'XINCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1905, N'QINGYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1906, N'GUWEI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1907, N'YANCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1908, N'LONGGANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1909, N'YUEYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1910, N'FUCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1911, N'SHUITOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1912, N'ZHIHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1913, N'DONGQU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1914, N'CHENGDU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1915, N'NANCHONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1916, N'DAZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1917, N'MIANYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1918, N'YIBIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1919, N'LUZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1920, N'NEIJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1921, N'YANJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1922, N'DEYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1923, N'GUANG’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1924, N'SUINING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1925, N'LESHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1926, N'BAZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1927, N'MEISHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1928, N'ZIGONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1929, N'GUANGYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1930, N'GAOPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1931, N'YUCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1932, N'DADUKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1933, N'TAIHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1934, N'ZHONGBA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1935, N'LANGZHONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1936, N'XICHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1937, N'GUANKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1938, N'JIN’E')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1939, N'LUOCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1940, N'JIANNAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1941, N'FANGTING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1942, N'TAIPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1943, N'SHUANGHEJIEDAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1944, N'LUCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1945, N'ZHANGGU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1946, N'MA’ERKANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1947, N'DINGPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1948, N'SUISHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1949, N'LIUCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1950, N'DONGSHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1951, N'QUJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1952, N'NANLONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1953, N'LONGQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1954, N'JIANCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1955, N'XINDU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1956, N'NANWAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1957, N'ZHUYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1958, N'HUOHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1959, N'WENLIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1960, N'LANGCHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1961, N'YUJIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1962, N'JIULONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1963, N'WUJIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1964, N'XIWAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1965, N'TIANPENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1966, N'YUEYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1967, N'BAIXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1968, N'JIANGKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1969, N'YANCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1970, N'YUECHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1971, N'TONGCHUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1972, N'CHICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1973, N'XINMIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1974, N'YANKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1975, N'PITONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1976, N'YANLING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1977, N'CHONGLONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1978, N'NUOJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1979, N'NANXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1980, N'HEJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1981, N'KAIJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1982, N'JINCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1983, N'YUNXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1984, N'HUILI CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1985, N'XUYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1986, N'YANCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1987, N'PENGLAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1988, N'RENHE')
GO
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1989, N'TIANCHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1990, N'GONGJING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1991, N'XUYONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1992, N'ZHOUKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1993, N'QINGFU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1994, N'JIANG’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1995, N'MINJIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1996, N'DEZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1997, N'XINNING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1998, N'CHANGNING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (1999, N'XUNCHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2000, N'FUJI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2001, N'LINGJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2002, N'PUJI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2003, N'NANJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2004, N'JINCHUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2005, N'NAXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2006, N'XINCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2007, N'ZHAOZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2008, N'DONGHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2009, N'YONGCHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2010, N'WENCHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2011, N'HUAGAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2012, N'XINZHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2013, N'YONGLE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2014, N'HUIDONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2015, N'JUNLIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2016, N'XINSHIBA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2017, N'JINCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2018, N'SHAPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2019, N'MUXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2020, N'ANJU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2021, N'YANTAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2022, N'YUANBA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2023, N'FUSHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2024, N'GUANGMING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2025, N'CHENGXIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2026, N'PISHA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2027, N'GULIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2028, N'ZHONGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2029, N'TIANDIBA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2030, N'TEMULI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2031, N'CHAOTIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2032, N'WEIZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2033, N'LUQIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2034, N'FENGYI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2035, N'LONG’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2036, N'SHAWAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2037, N'ABA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2038, N'XIQU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2039, N'YANJING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2040, N'LUOJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2041, N'QIAOWA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2042, N'SHIRONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2043, N'XINFA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2044, N'HEPINGYIZU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2045, N'ZAGUNAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2046, N'GANZI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2047, N'JIN’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2048, N'MUPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2049, N'PANLIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2050, N'XINDOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2051, N'SANGPI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2052, N'GAOCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2053, N'XIANSHUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2054, N'QIONGXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2055, N'RULONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2056, N'QIAOZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2057, N'SONGMAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2058, N'TONGZILIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2059, N'JINZHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2060, N'MEIXING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2061, N'LUHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2062, N'BATANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2063, N'JIANSHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2064, N'XIASI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2065, N'GENGQING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2066, N'HEKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2067, N'XIA’ER')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2068, N'RANGKE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2069, N'SEKE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2070, N'DAZHASI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2071, N'NIXIA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2072, N'HANGU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2073, N'DAYINGMEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2074, N'CHANGHONGJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2075, N'XIAOBAILOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2076, N'WANGHAILOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2077, N'DAWANGZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2078, N'XIANSHUIGU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2079, N'XIYUZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2080, N'JINGHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2081, N'ZHANGGUIZHUANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2082, N'GUOYUAN XINCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2083, N'ÜRÜMQI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2084, N'TURPAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2085, N'KUMUL')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2086, N'KORLA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2087, N'AKSU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2088, N'AILAN MUBAGE')
GO
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2089, N'KASHGAR')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2090, N'YAN’AN BEILU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2091, N'GHULJA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2092, N'KARAMAY')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2093, N'SHIHEZI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2094, N'SHACHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2095, N'HOTAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2096, N'ATUSHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2097, N'BOLE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2098, N'KUYTUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2099, N'FUKANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2100, N'TACHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2101, N'ALTAY')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2102, N'KUQA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2103, N'WUJIAQU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2104, N'KORGAS')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2105, N'KOKTOKAY')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2106, N'KARGILIK')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2107, N'KARAKAX')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2108, N'BAICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2109, N'HANERIK')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2110, N'KHUTUBI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2111, N'ALASHANKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2112, N'YANQI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2113, N'JELILYÜZI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2114, N'BAISHI AIRIKECUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2115, N'ELIXKU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2116, N'AKTO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2117, N'PEYZIWAT')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2118, N'TEKES')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2119, N'LIANMUQIN KANCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2120, N'QARQAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2121, N'NILKA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2122, N'TOKSUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2123, N'TOLI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2124, N'GUMA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2125, N'UCHTURPAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2126, N'TOQSU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2127, N'YULI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2128, N'QAPQAL')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2129, N'HOXUT')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2130, N'CHINGGIL')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2131, N'RUOQIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2132, N'DABANCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2133, N'XINGFULU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2134, N'SHUIMOGOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2135, N'BEIJINGLU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2136, N'YILI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2137, N'NU’ERBAGE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2138, N'EMIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2139, N'POSKAM')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2140, N'MUGALA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2141, N'AWAT')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2142, N'SHULE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2143, N'MAYTAGH')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2144, N'ARAL')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2145, N'LOP')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2146, N'AKSU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2147, N'LUNTAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2148, N'BAGRAX')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2149, N'JIMSAR')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2150, N'TOKKUZTARA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2151, N'YOPURGA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2152, N'XINYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2153, N'WUQIA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2154, N'HEJING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2155, N'NIYA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2156, N'QIRA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2157, N'KALPIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2158, N'ZHAOSU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2159, N'AHEQI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2160, N'BURQIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2161, N'URHO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2162, N'XAYAR')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2163, N'KUNMING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2164, N'QUJING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2165, N'ZHAOTONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2166, N'BAOSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2167, N'LINCANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2168, N'YUXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2169, N'RONGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2170, N'DAYAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2171, N'XIPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2172, N'DALI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2173, N'TENGYUE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2174, N'CHUXIONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2175, N'JINGHONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2176, N'KAIHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2177, N'XICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2178, N'WENLAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2179, N'LIANRAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2180, N'KAIYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2181, N'LUZHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2182, N'LIN’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2183, N'FENGLU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2184, N'SIMAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2185, N'ZHAXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2186, N'XIANGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2187, N'AIHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2188, N'DONGGUAZHEN')
GO
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2189, N'MENGDINGJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2190, N'YILONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2191, N'YUNFU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2192, N'LIANCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2193, N'JINBI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2194, N'XILUODU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2195, N'JINSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2196, N'97YI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2197, N'WEIYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2198, N'DONGCHUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2199, N'PINGYUANJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2200, N'MENGLANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2201, N'LONGCHUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2202, N'XINDIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2203, N'JINHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2204, N'MABAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2205, N'JIANGNA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2206, N'ZHONGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2207, N'XIANGJIABA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2208, N'WENPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2209, N'XINHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2210, N'BAMEI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2211, N'YONGBEI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2212, N'JIANTANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2213, N'MALI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2214, N'ZHEXIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2215, N'NANJIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2216, N'HUANGHUAJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2217, N'LONGTOUSHAN JIEZI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2218, N'ZHUJIACUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2219, N'MENGMENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2220, N'NANZHUANGZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2221, N'XISA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2222, N'NONGZHANGJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2223, N'TUODIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2224, N'MENGHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2225, N'XIN’ANSUO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2226, N'NANSAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2227, N'CUIHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2228, N'ZHUJIEZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2229, N'MENGDONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2230, N'YOUWANGJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2231, N'SHANGCAIYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2232, N'LAOJIEZI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2233, N'MENGLIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2234, N'XUNJIANSI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2235, N'SHANGPA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2236, N'MANGDONGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2237, N'CIYING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2238, N'GONGLANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2239, N'SHANGTIANBA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2240, N'ZHEDAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2241, N'XIAQIAOTOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2242, N'JIAOXIYAKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2243, N'KAIWEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2244, N'XINCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2245, N'KAJI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2246, N'SHENGPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2247, N'JINZHONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2248, N'LONGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2249, N'XIUSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2250, N'JINNIU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2251, N'WUFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2252, N'PINGPO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2253, N'KUANGYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2254, N'ZHONGSHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2255, N'DAJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2256, N'LUFU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2257, N'XINHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2258, N'SONGYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2259, N'DIANYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2260, N'ZHANGFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2261, N'ZHONGBA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2262, N'ZHONGSHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2263, N'KUNYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2264, N'MICHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2265, N'FENGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2266, N'YUANMA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2267, N'LONGQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2268, N'HUANGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2269, N'MIYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2270, N'QINGFENGLIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2271, N'LUOXIONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2272, N'ZHONG’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2273, N'JIAOKUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2274, N'ZOUMACHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2275, N'PINGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2276, N'XIAOPINGBA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2277, N'SANKOUTANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2278, N'SHUANGJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2279, N'MACHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2280, N'YUELEJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2281, N'JINPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2282, N'TONGQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2283, N'YISA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2284, N'GANGOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2285, N'YANJING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2286, N'NINGZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2287, N'SHUIYING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2288, N'YUJIAZHAI')
GO
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2289, N'GUJI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2290, N'XINGLONGCHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2291, N'NIUPIZHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2292, N'XINJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2293, N'RENDE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2294, N'JINCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2295, N'YOUDIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2296, N'NING’ER')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2297, N'BUJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2298, N'DANFENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2299, N'TANTOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2300, N'DALIYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2301, N'SHUIGOU’AO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2302, N'YINGJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2303, N'LIJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2304, N'HUANGGEXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2305, N'MENGHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2306, N'YONGDING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2307, N'GAOJIACUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2308, N'GUISHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2309, N'JIECUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2310, N'TIANXINGCHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2311, N'SHUITIANZHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2312, N'GENGMA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2313, N'TIEXIANXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2314, N'SANGUANZHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2315, N'LIANZHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2316, N'YUHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2317, N'CHUANSIBA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2318, N'LAOJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2319, N'JIECUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2320, N'NANSHA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2321, N'JINPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2322, N'DAXING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2323, N'NANZHAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2324, N'SHUIMO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2325, N'DAXING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2326, N'SHANGJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2327, N'JINHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2328, N'SHANJIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2329, N'XINJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2330, N'LONGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2331, N'JIEZISHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2332, N'LAODIANZI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2333, N'GOUJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2334, N'HEKOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2335, N'LEIDABA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2336, N'SHANGBA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2337, N'MAOSHANJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2338, N'LAOJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2339, N'GONGHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2340, N'DOUSHAGUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2341, N'CHENGFANGQIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2342, N'DEDANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2343, N'SHANZIDI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2344, N'QIAOSHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2345, N'YONGDING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2346, N'DASONGSHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2347, N'ZHONGXIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2348, N'XISHAQIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2349, N'NAYUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2350, N'YUNHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2351, N'JINDING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2352, N'JIANXINCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2353, N'SHIZIBA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2354, N'ZHONGHECHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2355, N'AITIANBA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2356, N'ZHONGCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2357, N'XIANGYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2358, N'MOSHIYI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2359, N'NAHAPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2360, N'SUJIAYING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2361, N'WANHECHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2362, N'TAIPINGDIAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2363, N'YUPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2364, N'DIANWEIJIE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2365, N'LAOJIEZI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2366, N'LAOFANGZI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2367, N'MUZENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2368, N'JIEZI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2369, N'BAOHE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2370, N'CHANGPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2371, N'MENGSUO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2372, N'HUANGJINGBA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2373, N'XIAOTIECHANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2374, N'ENLE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2375, N'SHUIGOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2376, N'PENGJIA ZHAIZI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2377, N'SHIMEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2378, N'PUJIAWAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2379, N'MENGLA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2380, N'SAZIBA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2381, N'CHENGGAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2382, N'CIKAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2383, N'GELUWAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2384, N'BENGSHUTANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2385, N'ZHONGCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2386, N'LAZANZHONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2387, N'BAIYU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2388, N'NINGBO')
GO
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2389, N'HANGZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2390, N'TAIZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2391, N'JINHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2392, N'SHAOXING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2393, N'JIAXING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2394, N'WENZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2395, N'HUZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2396, N'QUZHOU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2397, N'LISHUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2398, N'XUSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2399, N'RUI’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2400, N'YUEQING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2401, N'WENLING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2402, N'YIWU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2403, N'ZHUJI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2404, N'ZHOUSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2405, N'YUYAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2406, N'LINHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2407, N'WUTONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2408, N'XIASHI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2409, N'DONGYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2410, N'FUYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2411, N'GULI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2412, N'SHANHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2413, N'PINGHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2414, N'ZHUGANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2415, N'LANXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2416, N'JIAOJIANGCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2417, N'JIANGSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2418, N'BAISHA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2419, N'LONGQUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2420, N'HUANGYAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2421, N'XUQIAOCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2422, N'WANGJIA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2423, N'WENXICUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2424, N'TIANNINGCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2425, N'YAOZHUANGCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2426, N'SHIMENCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2427, N'XINJUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2428, N'DAMA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2429, N'SHENJIABANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2430, N'TAOZHUANGCUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2431, N'WUMA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2432, N'LOUQIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2433, N'SHUANGLING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2434, N'DONGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2435, N'XIAOSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2436, N'LUBEI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2437, N'BEILUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2438, N'CHENGZHONG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2439, N'LANJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2440, N'ZHAOBAOSHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2441, N'BAIGUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2442, N'GUCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2443, N'TAIPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2444, N'WEITANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2445, N'DAISHAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2446, N'FENGHUA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2447, N'WUYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2448, N'YUECHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2449, N'DONGCHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2450, N'LIN’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2451, N'NINGHAI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2452, N'DUOHU')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2453, N'HECHENG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2454, N'LINPING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2455, N'PUYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2457, N'DANXI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2458, N'FUYING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2459, N'DEQING')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2460, N'HAIMEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2461, N'XIN’ANJIANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2462, N'WUYUN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2463, N'SHIQIAO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2464, N'LUOYANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2465, N'PAN’AN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2466, N'SONGYUAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2467, N'KAIHUA CHENGGUANZHEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2468, N'SHANGTANG')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2469, N'MAR DEL PLATA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2470, N'LANUS')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2471, N'FLORENCIO VARELA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2472, N'BAHIA BLANCA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2473, N'MERLO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2474, N'GONZALEZ CATAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2475, N'QUILMES')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2476, N'BANFIELD')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2477, N'JOSE C. PAZ')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2478, N'ISIDRO CASANOVA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2479, N'LA PLATA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2480, N'BERAZATEGUI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2481, N'SAN MIGUEL')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2482, N'JOSE MARIA EZEIZA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2484, N'RAFAEL CASTILLO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2485, N'FLORENCIO VARELA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2486, N'SAN JUSTO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2487, N'ITUZAINGO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2488, N'TEMPERLEY')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2489, N'RAMOS MEJIA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2490, N'LOMAS DE ZAMORA')
GO
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2491, N'TANDIL')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2492, N'BERNAL')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2493, N'CASTELAR')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2494, N'ESTEBAN ECHEVERRIA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2495, N'MORON')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2496, N'VILLA LUZURIAGA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2497, N'CASEROS')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2498, N'LIBERTAD')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2499, N'BURZACO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2501, N'SAN FRANCISCO SOLANO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2502, N'MONTE CHINGOLO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2503, N'REMEDIOS DE ESCALADA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2504, N'EZPELETA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2505, N'LOMAS DEL MIRADOR')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2506, N'BELLA VISTA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2507, N'WILDE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2508, N'VILLA DOMINICO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2509, N'LOS POLVORINES')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2510, N'RAFAEL CALZADA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2511, N'LONGCHAMPS')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2512, N'VILLA ALSINA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2513, N'SAN ISIDRO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2514, N'JOSE MARMOL')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2515, N'HAEDO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2516, N'MUNRO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2517, N'DOCK SUR')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2518, N'VILLA ADELINA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2519, N'ADROGUE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2520, N'AVELLANEDA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2521, N'VICENTE LOPEZ')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2522, N'TAPIALES')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2523, N'DON BOSCO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2524, N'VILLA SARMIENTO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2525, N'ALDO BONZI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2526, N'ZARATE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2527, N'PERGAMINO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2528, N'CAMPANA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2529, N'OLAVARRIA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2530, N'JUNIN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2531, N'PILAR')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2532, N'LUJAN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2533, N'NECOCHEA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2534, N'SARANDI')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2535, N'PUNTA ALTA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2536, N'AZUL')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2537, N'CHIVILCOY')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2538, N'MERCEDES')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2539, N'EL TALAR DE PACHECO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2540, N'LA REJA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2541, N'SAN PEDRO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2542, N'TRES ARROYOS')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2543, N'PINAMAR')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2544, N'BALCARCE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2545, N'NUEVE DE JULIO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2546, N'CHACABUCO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2547, N'BRAGADO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2548, N'VILLA GESELL')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2549, N'BARADERO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2550, N'DOLORES')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2551, N'LINCOLN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2552, N'CORONEL SUAREZ')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2553, N'VEINTICINCO DE MAYO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2554, N'CHASCOMUS')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2555, N'BRANDSEN')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2556, N'LOBOS')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2558, N'AYACUCHO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2559, N'CARMEN DE ARECO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2560, N'MAR DE AJO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2561, N'CORONEL DORREGO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2562, N'BENITO JUAREZ')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2563, N'LAPRIDA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2564, N'CARHUE')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2565, N'PEDRO LURO')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2566, N'DARREGUEIRA')
INSERT [Sistema].[Ciudad] ([id_ciudad], [nombre]) VALUES (2567, N'VILLALONGA')
SET IDENTITY_INSERT [Sistema].[Ciudad] OFF
GO
SET IDENTITY_INSERT [Sistema].[Continente] ON 

INSERT [Sistema].[Continente] ([id_continente], [nombre]) VALUES (1, N'UNIÓN EUROPEA')
INSERT [Sistema].[Continente] ([id_continente], [nombre]) VALUES (2, N'RESTO DE EUROPA')
INSERT [Sistema].[Continente] ([id_continente], [nombre]) VALUES (3, N'AFRICA')
INSERT [Sistema].[Continente] ([id_continente], [nombre]) VALUES (4, N'AMERICA DEL NORTE')
INSERT [Sistema].[Continente] ([id_continente], [nombre]) VALUES (5, N'CENTRO AMERICA Y CARIBE')
INSERT [Sistema].[Continente] ([id_continente], [nombre]) VALUES (6, N'SUDAMERICA')
INSERT [Sistema].[Continente] ([id_continente], [nombre]) VALUES (7, N'ASIA')
INSERT [Sistema].[Continente] ([id_continente], [nombre]) VALUES (8, N'OCEANÍA')
SET IDENTITY_INSERT [Sistema].[Continente] OFF
GO
SET IDENTITY_INSERT [Sistema].[Deposito] ON 

INSERT [Sistema].[Deposito] ([id_deposito], [nombre], [domicilio], [telefono], [fax], [mail]) VALUES (1, N'POCITOS', N'TRES ARROYOS 485', NULL, NULL, NULL)
INSERT [Sistema].[Deposito] ([id_deposito], [nombre], [domicilio], [telefono], [fax], [mail]) VALUES (2, N'COMARCA', N'MURILLO 555', NULL, NULL, NULL)
SET IDENTITY_INSERT [Sistema].[Deposito] OFF
GO
SET IDENTITY_INSERT [Sistema].[Division_Politica] ON 

INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (1, N'BIZKAIA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (2, N'ASTURIAS')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (3, N'LAS PALMAS')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (4, N'PONTEVEDRA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (5, N'JAÉN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (6, N'GUADALAJARA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (7, N'ILLES BALEARS')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (8, N'NAVARRA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (9, N'GRANADA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (10, N'LA RIOJA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (11, N'A CORUÑA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (12, N'TERUEL')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (13, N'ZARAGOZA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (14, N'BADAJOZ')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (15, N'HUESCA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (16, N'ARABA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (17, N'GIRONA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (18, N'ALACANT')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (19, N'MURCIA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (20, N'SEGOVIA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (21, N'ZAMORA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (22, N'PALENCIA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (23, N'ALBACETE')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (24, N'CÁCERES')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (25, N'CIUDAD REAL')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (26, N'LLEIDA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (27, N'MÁLAGA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (28, N'LUGO')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (29, N'BARCELONA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (30, N'CUENCA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (31, N'SORIA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (32, N'TOLEDO')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (33, N'CASTELLÓ')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (34, N'HUELVA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (35, N'SANTA CRUZ DE TENERIFE')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (36, N'OURENSE')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (37, N'TARRAGONA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (38, N'ALMERÍA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (39, N'CÓRDOBA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (40, N'LEÓN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (41, N'BURGOS')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (42, N'GIPUZCOA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (43, N'SALAMANCA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (44, N'MELILLA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (45, N'SEVILLA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (46, N'VALLADOLID')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (47, N'CEUTA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (48, N'BUENOS AIRES')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (49, N'CIUDAD AUTÓNOMA DE BUENOS AIRES')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (50, N'CATAMARCA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (51, N'CHACO')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (52, N'CHUBUT')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (53, N'CÓRDOBA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (54, N'CORRIENTES')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (55, N'ENTRE RÍOS')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (56, N'FORMOSA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (57, N'JUJUY')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (58, N'LA PAMPA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (59, N'LA RIOJA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (60, N'MENDOZA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (61, N'MISIONES')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (62, N'NEUQUÉN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (63, N'RÍO NEGRO')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (64, N'SALTA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (65, N'SAN JUAN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (66, N'SAN LUIS')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (67, N'SANTA CRUZ')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (68, N'SANTA FE')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (69, N'SANTIAGO DEL ESTERO')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (70, N'TIERRA DEL FUEGO, ANTÁRTIDA E ISLAS DEL ATLÁNTICO SUR')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (71, N'TUCUMÁN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (72, N'MACAO')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (73, N'HONG KONG')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (74, N'BEIJING')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (75, N'SHANGHÁI')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (76, N'JIANGSU')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (77, N'ZHEJIANG')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (78, N'FUJIAN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (79, N'GUANGDONG')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (80, N'TIANJIN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (81, N'HUBEI')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (82, N'CHONGQING')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (83, N'SHANDONG')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (84, N'INNER MONGOL')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (85, N'SHAANXI')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (86, N'ANHUI')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (87, N'HUNAN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (88, N'LIAONING')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (89, N'HAINAN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (90, N'HENAN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (91, N'SICHUAN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (92, N'XINJIANG')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (93, N'NINGXIA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (94, N'JIANGXI')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (95, N'QINGHAI')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (96, N'TÍBET')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (97, N'YUNNAN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (98, N'GUIZHOU')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (99, N'HEBEI')
GO
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (100, N'SHANXI')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (101, N'JILIN')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (102, N'GUANGXI')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (103, N'HEILONGJIANG')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (104, N'GANSU')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (105, N'ACRE')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (106, N'ALAGOAS')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (107, N'ALAGOAS')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (108, N'AMAPÁ')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (109, N'AMAZONAS')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (110, N'BAHIA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (111, N'CEARÁ')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (112, N'ESPÍRITO SANTO')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (113, N'GOIÁS')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (114, N'MARANHÃO')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (115, N'MATO GROSSO')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (116, N'MATO GROSSO DO SUL')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (117, N'MINAS GERAIS')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (118, N'PARÁ')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (119, N'PARAÍBA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (120, N'PARANÁ')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (121, N'PERNAMBUCO')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (122, N'PIAUÍ')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (123, N'RIO DE JANEIRO')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (124, N'RIO GRANDE DO SUL')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (125, N'RONDÔNIA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (126, N'SANTA CATARINA')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (127, N'SÃO PAULO')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (128, N'SERGIPE')
INSERT [Sistema].[Division_Politica] ([id_division_politica], [nombre]) VALUES (129, N'TOCANTINS')
SET IDENTITY_INSERT [Sistema].[Division_Politica] OFF
GO
SET IDENTITY_INSERT [Sistema].[Envio] ON 

INSERT [Sistema].[Envio] ([id_envio], [descripcion]) VALUES (1, N'MARITIMO')
INSERT [Sistema].[Envio] ([id_envio], [descripcion]) VALUES (2, N'AEREO')
INSERT [Sistema].[Envio] ([id_envio], [descripcion]) VALUES (3, N'TERRESTRE')
SET IDENTITY_INSERT [Sistema].[Envio] OFF
GO
SET IDENTITY_INSERT [Sistema].[Estado] ON 

INSERT [Sistema].[Estado] ([id_estado], [descripcion]) VALUES (0, N'OC Abierta')
INSERT [Sistema].[Estado] ([id_estado], [descripcion]) VALUES (1, N'Solicitado')
INSERT [Sistema].[Estado] ([id_estado], [descripcion]) VALUES (2, N'En transito')
INSERT [Sistema].[Estado] ([id_estado], [descripcion]) VALUES (3, N'Arribado')
INSERT [Sistema].[Estado] ([id_estado], [descripcion]) VALUES (4, N'En Stock')
SET IDENTITY_INSERT [Sistema].[Estado] OFF
GO
SET IDENTITY_INSERT [Sistema].[Localidad] ON 

INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (1, N'25 DE MAYO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (2, N'9 DE JULIO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (3, N'ADOLFO ALSINA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (4, N'ADOLFO GONZALES CHAVES', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (5, N'ALBERTI', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (6, N'ALMIRANTE BROWN', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (7, N'ARRECIFES', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (8, N'AVELLANEDA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (9, N'AYACUCHO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (10, N'AZUL', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (11, N'BAHÍA BLANCA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (12, N'BALCARCE', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (13, N'BARADERO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (14, N'BENITO JUAREZ', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (15, N'BERAZATEGUI', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (16, N'BERISSO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (17, N'BOLIVAR', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (18, N'BRAGADO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (19, N'BRANDSEN', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (20, N'CAMPANA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (21, N'CAÑUELAS', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (22, N'CAPITAN SARMIENTO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (23, N'CARLOS CASARES', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (24, N'CARLOS TEJEDOR', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (25, N'CARMEN DE ARECO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (26, N'CASTELLI', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (27, N'CHACABUCO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (28, N'CHASCOMUS', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (29, N'CHIVILCOY', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (30, N'COLON', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (31, N'CORONEL DE MARINA L ROSALES', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (32, N'CORONEL DORREGO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (33, N'CORONEL PRINGLES', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (34, N'CORONEL SUAREZ', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (35, N'DAIREAUX', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (36, N'DOLORES', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (37, N'ENSENADA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (38, N'ESCOBAR', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (39, N'ESTEBAN ECHEVERRIA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (40, N'EXALTACIÓN DE LA CRUZ', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (41, N'EZEIZA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (42, N'FLORENCIO VARELA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (43, N'FLORENTINO AMEGHINO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (44, N'GENERAL ALVARADO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (45, N'GENERAL ALVEAR', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (46, N'GENERAL ARENALES', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (47, N'GENERAL BELGRANO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (48, N'GENERAL GUIDO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (49, N'GENERAL JUAN MADARIAGA ', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (50, N'GENERAL LA MADRID', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (51, N'GENERAL LAVALLE', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (52, N'GENERAL PAZ', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (53, N'GENERAL PINTO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (54, N'GENERAL PUEYRREDON', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (55, N'GENERAL RODRIGUEZ', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (56, N'GENERAL SAN MARTIN', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (57, N'GENERAL VIAMONTE', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (58, N'GENERAL VILLEGAS', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (59, N'GUAMINI', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (60, N'HIPOLITO YRIGOYEN ', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (61, N'HURLINGHAM', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (62, N'ITUZAINGO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (63, N'JOSE C PAZ', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (64, N'JUNIN', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (65, N'LA COSTA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (66, N'LA MATANZA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (67, N'LA PLATA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (68, N'LANÚS', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (69, N'LAPRIDA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (70, N'LAS FLORES', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (71, N'LEANDRO N ALEM', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (72, N'LEZAMA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (73, N'LINCOLN', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (74, N'LOBERIA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (75, N'LOBOS', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (76, N'LOMAS DE ZAMORA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (77, N'LUJAN', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (78, N'MAGDALENA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (79, N'MAIPU', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (80, N'MALVINAS ARGENTINAS', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (81, N'MAR CHIQUITA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (82, N'MARCOS PAZ', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (83, N'MERCEDES', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (84, N'MERLO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (85, N'MONTE', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (86, N'MONTE HERMOSO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (87, N'MORENO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (88, N'MORON', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (89, N'NAVARRO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (90, N'NECOCHEA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (91, N'OLAVARRIA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (92, N'PATAGONES', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (93, N'PEHUAJO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (94, N'PELLEGRINI', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (95, N'PERGAMINO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (96, N'PILA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (97, N'PILAR', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (98, N'PINAMAR', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (99, N'PRESIDENTE PERON', NULL, NULL)
GO
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (100, N'PUAN', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (101, N'PUNTA INDIO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (102, N'QUILMES', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (103, N'RAMALLO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (104, N'RAUCH', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (105, N'RIVADAVIA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (106, N'ROJAS', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (107, N'ROQUE PEREZ', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (108, N'SAAVEDRA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (109, N'SALADILLO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (110, N'SALLIQUELO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (111, N'SALTO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (112, N'SAN ANDRES DE GILES ', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (113, N'SAN ANTONIO DE ARECO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (114, N'SAN CAYETANO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (115, N'SAN FERNANDO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (116, N'SAN ISIDRO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (117, N'SAN MIGUEL', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (118, N'SAN NICOLAS', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (119, N'SAN PEDRO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (120, N'SAN VICENTE', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (121, N'SUIPACHA', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (122, N'TANDIL', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (123, N'TAPALQUE', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (124, N'TIGRE', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (125, N'TORDILLO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (126, N'TORNQUIST', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (127, N'TRENQUE LAUQUEN', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (128, N'TRES ARROYOS', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (129, N'TRES DE FEBRERO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (130, N'TRES LOMAS', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (131, N'VICENTE LOPEZ', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (132, N'VILLA GESELL', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (133, N'VILLARINO', NULL, NULL)
INSERT [Sistema].[Localidad] ([id_localidad], [nombre], [prefijo_telefonico], [codigo_postal]) VALUES (134, N'ZARATE', NULL, NULL)
SET IDENTITY_INSERT [Sistema].[Localidad] OFF
GO
SET IDENTITY_INSERT [Sistema].[Medio_Pago] ON 

INSERT [Sistema].[Medio_Pago] ([id_medio_pago], [descripcion]) VALUES (1, N'TRANSEFERENCIA BANCARIA')
INSERT [Sistema].[Medio_Pago] ([id_medio_pago], [descripcion]) VALUES (2, N'CHEQUE DIFERIDO')
INSERT [Sistema].[Medio_Pago] ([id_medio_pago], [descripcion]) VALUES (3, N'CHEQUE DIGITAL')
INSERT [Sistema].[Medio_Pago] ([id_medio_pago], [descripcion]) VALUES (4, N'EFECTIVO')
SET IDENTITY_INSERT [Sistema].[Medio_Pago] OFF
GO
SET IDENTITY_INSERT [Sistema].[Moneda] ON 

INSERT [Sistema].[Moneda] ([id_moneda], [nomenclatura], [descripcion]) VALUES (1, N'USD', N'DOLAR ESTADOUNIDENSE')
INSERT [Sistema].[Moneda] ([id_moneda], [nomenclatura], [descripcion]) VALUES (2, N'EUR', N'EURO')
INSERT [Sistema].[Moneda] ([id_moneda], [nomenclatura], [descripcion]) VALUES (3, N'RMB', N'RENMINBI CHINO')
INSERT [Sistema].[Moneda] ([id_moneda], [nomenclatura], [descripcion]) VALUES (4, N'ARS', N'PESO ARGENTINO')
SET IDENTITY_INSERT [Sistema].[Moneda] OFF
GO
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (101, N'ALBANIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (102, N'AUSTRIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (103, N'BELGICA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (104, N'BULGARIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (106, N'CHIPRE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (107, N'DINAMARCA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (108, N'ESPAÑA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (109, N'FINLANDIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (110, N'FRANCIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (111, N'GRECIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (112, N'HUNGRIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (113, N'IRLANDA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (114, N'ISLANDIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (115, N'ITALIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (116, N'LIECHTENSTEIN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (117, N'LUXEMBURGO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (118, N'MALTA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (119, N'MONACO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (120, N'NORUEGA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (121, N'PAISES BAJOS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (122, N'POLONIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (123, N'PORTUGAL', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (124, N'ANDORRA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (125, N'REINO UNIDO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (126, N'ALEMANIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (128, N'RUMANIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (129, N'SAN MARINO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (130, N'SANTA SEDE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (131, N'SUECIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (132, N'SUIZA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (135, N'UCRANIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (136, N'LETONIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (137, N'MOLDAVIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (138, N'BELARUS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (139, N'GEORGIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (141, N'ESTONIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (142, N'LITUANIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (143, N'REPUBLICA CHECA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (144, N'REPUBLICA ESLOVACA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (145, N'BOSNIA Y HERZEGOVINA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (146, N'CROACIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (147, N'ESLOVENIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (148, N'ARMENIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (154, N'RUSIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (156, N'MACEDONIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (157, N'SERBIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (158, N'MONTENEGRO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (170, N'GUERNESEY', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (171, N'SVALBARD Y JAN MAYEN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (172, N'ISLAS FEROE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (173, N'ISLA DE MAN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (174, N'GIBRALTAR', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (175, N'ISLAS DEL CANAL', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (176, N'JERSEY', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (177, N'ISLAS ALAND', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (198, N'OTROS PAISES O TERRITORIOS DE LA UNION EUROPEA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (199, N'OTROS PAISES O TERRITORIOS DEL RESTO DE EUROPA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (201, N'BURKINA FASO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (202, N'ANGOLA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (203, N'ARGELIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (204, N'BENIN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (205, N'BOTSWANA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (206, N'BURUNDI', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (207, N'CABO VERDE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (208, N'CAMERUN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (209, N'COMORES', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (210, N'CONGO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (211, N'COSTA DE MARFIL', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (212, N'DJIBOUTI', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (213, N'EGIPTO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (214, N'ETIOPIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (215, N'GABON', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (216, N'GAMBIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (217, N'GHANA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (218, N'GUINEA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (219, N'GUINEA-BISSAU', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (220, N'GUINEA ECUATORIAL', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (221, N'KENIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (222, N'LESOTHO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (223, N'LIBERIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (224, N'LIBIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (225, N'MADAGASCAR', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (226, N'MALAWI', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (227, N'MALI', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (228, N'MARRUECOS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (229, N'MAURICIO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (230, N'MAURITANIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (231, N'MOZAMBIQUE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (232, N'NAMIBIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (233, N'NIGER', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (234, N'NIGERIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (235, N'REPUBLICA CENTROAFRICANA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (236, N'SUDAFRICA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (237, N'RUANDA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (238, N'SANTO TOME Y PRINCIPE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (239, N'SENEGAL', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (240, N'SEYCHELLES', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (241, N'SIERRA LEONA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (242, N'SOMALIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (243, N'SUDAN', NULL, NULL)
GO
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (244, N'SWAZILANDIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (245, N'TANZANIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (246, N'CHAD', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (247, N'TOGO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (248, N'TUNEZ', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (249, N'UGANDA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (250, N'REP.DEMOCRATICA DEL CONGO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (251, N'ZAMBIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (252, N'ZIMBABWE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (253, N'ERITREA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (260, N'SANTA HELENA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (261, N'REUNION', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (262, N'MAYOTTE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (263, N'SAHARA OCCIDENTAL', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (299, N'OTROS PAISES O TERRITORIOS DE AFRICA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (301, N'CANADA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (302, N'ESTADOS UNIDOS DE AMERICA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (303, N'MEXICO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (310, N'ANTIGUA Y BARBUDA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (311, N'BAHAMAS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (312, N'BARBADOS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (313, N'BELICE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (314, N'COSTA RICA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (315, N'CUBA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (316, N'DOMINICA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (317, N'EL SALVADOR', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (318, N'GRANADA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (319, N'GUATEMALA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (320, N'HAITI', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (321, N'HONDURAS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (322, N'JAMAICA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (323, N'NICARAGUA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (324, N'PANAMA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (325, N'SAN VICENTE Y LAS GRANADINAS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (326, N'REPUBLICA DOMINICANA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (327, N'TRINIDAD Y TOBAGO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (328, N'SANTA LUCIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (329, N'SAN CRISTOBAL Y NIEVES', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (340, N'ARGENTINA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (341, N'BOLIVIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (342, N'BRASIL', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (343, N'COLOMBIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (344, N'CHILE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (345, N'ECUADOR', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (346, N'GUYANA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (347, N'PARAGUAY', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (348, N'PERU', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (349, N'SURINAM', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (350, N'URUGUAY', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (351, N'VENEZUELA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (370, N'SAN PEDRO Y MIQUELON', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (371, N'GROENLANDIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (380, N'ISLAS CAIMÁN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (381, N'ISLAS TURCAS Y CAICOS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (382, N'ISLAS VÍRGENES DE LOS ESTADOS UNIDOS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (383, N'GUADALUPE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (384, N'ANTILLAS HOLANDESAS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (385, N'SAN MARTIN (PARTE FRANCESA)', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (386, N'ARUBA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (387, N'MONTSERRAT', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (388, N'ANGUILLA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (389, N'SAN BARTOLOME', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (390, N'MARTINICA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (391, N'PUERTO RICO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (392, N'BERMUDAS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (393, N'ISLAS VIRGENES BRITANICAS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (394, N'GUAYANA FRANCESA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (395, N'ISLAS MALVINAS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (396, N'OTROS PAISES  O TERRITORIOS DE AMERICA DEL NORTE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (398, N'OTROS PAISES O TERRITORIOS DEL CARIBE Y AMERICA CENTRAL', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (399, N'OTROS PAISES O TERRITORIOS  DE SUDAMERICA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (401, N'AFGANISTAN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (402, N'ARABIA SAUDI', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (403, N'BAHREIN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (404, N'BANGLADESH', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (405, N'MYANMAR', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (407, N'CHINA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (408, N'EMIRATOS ARABES UNIDOS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (409, N'FILIPINAS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (410, N'INDIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (411, N'INDONESIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (412, N'IRAQ', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (413, N'IRAN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (414, N'ISRAEL', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (415, N'JAPON', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (416, N'JORDANIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (417, N'CAMBOYA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (418, N'KUWAIT', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (419, N'LAOS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (420, N'LIBANO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (421, N'MALASIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (422, N'MALDIVAS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (423, N'MONGOLIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (424, N'NEPAL', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (425, N'OMAN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (426, N'PAKISTAN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (427, N'QATAR', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (430, N'COREA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (431, N'COREA DEL NORTE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (432, N'SINGAPUR', NULL, NULL)
GO
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (433, N'SIRIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (434, N'SRI LANKA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (435, N'TAILANDIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (436, N'TURQUIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (437, N'VIETNAM', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (439, N'BRUNEI', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (440, N'ISLAS MARSHALL', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (441, N'YEMEN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (442, N'AZERBAIYAN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (443, N'KAZAJSTAN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (444, N'KIRGUISTAN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (445, N'TADYIKISTAN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (446, N'TURKMENISTAN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (447, N'UZBEKISTAN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (448, N'ISLAS MARIANAS DEL NORTE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (449, N'PALESTINA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (450, N'HONG KONG', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (453, N'BHUTÁN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (454, N'GUAM', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (455, N'MACAO', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (499, N'OTROS PAISES O TERRITORIOS DE ASIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (501, N'AUSTRALIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (502, N'FIJI', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (504, N'NUEVA ZELANDA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (505, N'PAPUA NUEVA GUINEA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (506, N'ISLAS SALOMON', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (507, N'SAMOA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (508, N'TONGA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (509, N'VANUATU', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (511, N'MICRONESIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (512, N'TUVALU', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (513, N'ISLAS COOK', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (515, N'NAURU', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (516, N'PALAOS', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (517, N'TIMOR ORIENTAL', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (520, N'POLINESIA FRANCESA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (521, N'ISLA NORFOLK', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (522, N'KIRIBATI', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (523, N'NIUE', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (524, N'ISLAS PITCAIRN', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (525, N'TOKELAU', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (526, N'NUEVA CALEDONIA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (527, N'WALLIS Y FORTUNA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (528, N'SAMOA AMERICANA', NULL, NULL)
INSERT [Sistema].[Pais] ([id_pais], [nombre], [prefijo_telefonico], [iso]) VALUES (599, N'OTROS PAISES O TERRITORIOS DE OCEANIA', NULL, NULL)
GO
SET IDENTITY_INSERT [Sistema].[Pass] ON 

INSERT [Sistema].[Pass] ([id_pass], [clave], [fecha_alta], [vigente]) VALUES (1, N'678910', CAST(N'2022-08-26T15:45:00' AS SmallDateTime), 0)
INSERT [Sistema].[Pass] ([id_pass], [clave], [fecha_alta], [vigente]) VALUES (2, N'1', CAST(N'2022-09-25T15:45:00' AS SmallDateTime), 1)
SET IDENTITY_INSERT [Sistema].[Pass] OFF
GO
SET IDENTITY_INSERT [Sistema].[Perfil] ON 

INSERT [Sistema].[Perfil] ([id_perfil], [descripcion]) VALUES (1, N'TOTAL')
INSERT [Sistema].[Perfil] ([id_perfil], [descripcion]) VALUES (2, N'LECTURA')
INSERT [Sistema].[Perfil] ([id_perfil], [descripcion]) VALUES (3, N'ESCRITURA')
SET IDENTITY_INSERT [Sistema].[Perfil] OFF
GO
SET IDENTITY_INSERT [Sistema].[Usuario] ON 

INSERT [Sistema].[Usuario] ([id_usuario], [usuario], [apellido], [nombre], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (1, N'plinares', N'LINARES', N'PABLO', N'TRES ARROYOS 3485', N'1159582428', N'23515692', N'plinares1973@gmail.com', CAST(N'2022-09-25T15:43:00' AS SmallDateTime))
SET IDENTITY_INSERT [Sistema].[Usuario] OFF
GO
SET IDENTITY_INSERT [Venta].[Cliente] ON 

INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (1, N'20500089624', N'CACTUS COMIDAS PARA LLEVAR', N'CERRITO 333', NULL, N'50008962', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (2, N'20500089627', N'WOLSKI  ZAJAZD', N'UL. FILTROWA 68', NULL, N'50008962', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (3, N'20500090029', N'FOLIES GOURMANDES', N'184, CHAUSSÉE DE TOURNAI', NULL, N'50009002', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (4, N'20500092242', N'THE CRACKER BOX', N'55 GRIZZLY PEAK RD.', NULL, N'50009224', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (5, N'20500117571', N'FAMILIA ARQUIBALDO', N'RUA ORÓS, 92', NULL, N'50011757', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (6, N'20500124152', N'WHITE CLOVER MARKETS', N'305 - 14TH AVE. S. SUITE 3B', NULL, N'50012415', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (7, N'20500152547', N'FISSA FABRICA INTER. SALCHICHAS S.A.', N'C/ MORALZARZAL', NULL, N'50015254', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (8, N'20500802568', N'GROSELLA-RESTAURANTE', N'5ª AVE. LOS PALOS GRANDES', NULL, N'50080256', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (9, N'20516782362', N'VAFFELJERNET', N'SMAGSLOGET 45', NULL, N'51678236', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (10, N'20517292792', N'TRAILS HEAD GOURMET PROVISIONERS', N'722 DAVINCI BLVD.', NULL, N'51729279', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (11, N'20548274997', N'RICARDO ADOCICADOS', N'AV. COPACABANA, 267', NULL, N'54827499', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (12, N'20570948012', N'MORGENSTERN GESUNDKOST', N'HEERSTR. 22', NULL, N'57094801', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (13, N'20582622945', N'FRANKENVERSAND', N'BERLINER PLATZ 43', NULL, N'58262294', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (14, N'20596993873', N'FRANCE RESTAURATION', N'54, RUE ROYALE', NULL, N'59699387', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (15, N'20632161146', N'DIE WANDERNDE KUH', N'ADENAUERALLEE 900', NULL, N'63216114', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (16, N'20633008775', N'EASTERN CONNECTION', N'35 KING GEORGE', NULL, N'63300877', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (17, N'20642028754', N'VICTUAILLES EN STOCK', N'2, RUE DU COMMERCE', NULL, N'64202875', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (18, N'20645953556', N'VINS ET ALCOOLS CHEVALIER', N'59 RUE DE LABBAYE', NULL, N'64595355', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (19, N'20654118767', N'COMÉRCIO MINEIRO', N'AV. DOS LUSÍADAS, 23', NULL, N'65411876', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (20, N'20656319263', N'SIMONS BISTRO', N'VINBÆLTET 34', NULL, N'65631926', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (21, N'20657132000', N'GODOS COCINA TÍPICA', N'C/ ROMERO, 33', NULL, N'65713200', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (22, N'20661798501', N'SANTÉ GOURMET', N'ERLING SKAKKES GATE 78', NULL, N'66179850', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (23, N'20662145110', N'FRANCHI S.P.A.', N'VIA MONTE BIANCO 34', NULL, N'66214511', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (24, N'20679107220', N'FURIA BACALHAU E FRUTOS DO MAR', N'JARDIM DAS ROSAS N. 32', NULL, N'67910722', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (25, N'20696376782', N'TRADIÇÃO HIPERMERCADOS', N'AV. INÊS DE CASTRO, 414', NULL, N'69637678', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (26, N'20697615713', N'CONSOLIDATED HOLDINGS ', N'BERKELEY GARDENS 12  BREWERY', NULL, N'69761571', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (27, N'20701749150', N'FOLK OCH FÄ HB', N'ÅKERGATAN 24', NULL, N'70174915', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (28, N'20707467254', N'DRACHENBLUT DELIKATESSEN', N'WALSERWEG 21', NULL, N'70746725', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (29, N'20709311049', N'ERNST HANDEL', N'KIRCHGASSE 6', NULL, N'70931104', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (30, N'20709386642', N'WARTIAN HERKKU', N'TORIKATU 38', NULL, N'70938664', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (31, N'20711570000', N'GOURMET LANCHONETES', N'AV. BRASIL, 442', NULL, N'71157000', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (32, N'23500365019', N'BOTTOM-DOLLAR MARKETS', N'23 TSAWASSEN BLVD.', NULL, N'50036501', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (33, N'23537574581', N'TORTUGA RESTAURANTE', N'AVDA. AZTECA 123', NULL, N'53757458', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (34, N'23708162219', N'DU MONDE ENTIER', N'67, RUE DES CINQUANTE OTAGES', NULL, N'70816221', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (35, N'23708257589', N'GALERÍA DEL GASTRÓNOMO', N'RAMBLA DE CATALUÑA, 23', NULL, N'70825758', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (36, N'27656319263', N'LILA-SUPERMERCADO', N'CARRERA 52 CON AVE. BOLÍVAR #65-98 LLANO LARGO', NULL, N'65631926', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (37, N'30500089624', N'WILMAN KALA', N'KESKUSKATU 45', NULL, N'50008962', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (38, N'30500090029', N'OTTILIES KÄSELADEN', N'MEHRHEIMERSTR. 369', NULL, N'50009002', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (39, N'30500092242', N'MÈRE PAILLARDE', N'43 RUE ST. LAURENT', NULL, N'50009224', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (40, N'30500094156', N'MAGAZZINI ALIMENTARI RIUNITI  ', N'VIA LUDOVICO IL MORO 22', NULL, N'50009415', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (41, N'30500117571', N'OCÉANO ATLÁNTICO LTDA.', N'ING. GUSTAVO MONCADA 8585 PISO 20-A', NULL, N'50011757', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (42, N'30500124152', N'BS BEVERAGES', N'FAUNTLEROY CIRCUS', NULL, N'50012415', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (43, N'30500152547', N'OLD WORLD DELICATESSEN', N'2743 BERING ST.', NULL, N'50015254', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (44, N'30500802568', N'PARIS SPÉCIALITÉS', N'265, BOULEVARD CHARONNE', NULL, N'50080256', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (45, N'30516782362', N'ANA TRUJILLO EMPAREDADOS Y HELADOS  ', N'AVDA. DE LA CONSTITUCIÓN 2222', NULL, N'51678236', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (46, N'30517292792', N'ALFREDS FUTTERKISTE ', N'OBERE STR. 57', NULL, N'51729279', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (47, N'30521827765', N'RANCHO GRANDE', N'AV. DEL LIBERTADOR 900', NULL, N'52182776', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (48, N'30537574581', N'QUE DELÍCIA', N'RUA DA PANIFICADORA, 12', NULL, N'53757458', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (49, N'30544486183', N'LONESOME PINE RESTAURANT ', N'89 CHIAROSCURO RD.', NULL, N'54448618', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (50, N'30548274997', N'BÓLIDO COMIDAS PREPARADAS', N'C/ ARAQUIL, 67', NULL, N'54827499', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (51, N'30549547288', N'CHOP-SUEY CHINESE', N'HAUPTSTR. 29', NULL, N'54954728', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (52, N'30556056702', N'PERICLES COMIDAS CLÁSICAS', N'CALLE DR. JORGE CASH 321', NULL, N'55605670', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (53, N'30560956904', N'THE BIG CHEESE', N'89 JEFFERSON WAY SUITE 2', NULL, N'56095690', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (54, N'30570948012', N'TOMS SPEZIALITÄTEN', N'LUISENSTR. 48', NULL, N'57094801', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (55, N'30582622945', N'PRINCESA ISABEL VINHOS', N'ESTRADA DA SAÚDE N. 58', NULL, N'58262294', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (56, N'30596993873', N'ISLAND TRADING', N'GARDEN HOUSE CROWTHER WAY', NULL, N'59699387', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (57, N'30617999966', N'QUICK-STOP', N'TAUCHERSTRAßE 10', NULL, N'61799996', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (58, N'30632161146', N'BERGLUNDS SNABBKÖP', N'BERGUVSVÄGEN  8', NULL, N'63216114', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (59, N'30633008775', N'LINO-DELICATESES', N'AVE. 5 DE MAYO PORLAMAR', NULL, N'63300877', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (60, N'30642028754', N'ANTONIO MORENO TAQUERÍA', N'MATADEROS  2312', NULL, N'64202875', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (61, N'30645953556', N'AROUND THE HORN', N'120 HANOVER SQ.', NULL, N'64595355', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (62, N'30654118767', N'HANARI CARNES', N'RUA DO PAÇO, 67', NULL, N'65411876', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (63, N'30656319263', N'BLONDESDDSL PÈRE ET FILS', N'24, PLACE KLÉBER', NULL, N'65631926', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (64, N'30657132000', N'LAUGHING BACCHUS WINE CELLARS', N'1900 OAK ST.', NULL, N'65713200', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (65, N'30661798501', N'NORTH/SOUTH', N'SOUTH HOUSE 300 QUEENSBRIDGE', NULL, N'66179850', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (66, N'30662145110', N'KÖNIGLICH ESSEN', N'MAUBELSTR. 90', NULL, N'66214511', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (67, N'30677645896', N'GREAT LAKES FOOD MARKET', N'2732 BAKER BLVD.', NULL, N'67764589', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (68, N'30679107220', N'LA CORNE DABONDANCE', N'67, AVENUE DE LEUROPE', NULL, N'67910722', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (69, N'30696376782', N'RICHTER SUPERMARKT', N'GRENZACHERWEG 237', NULL, N'69637678', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (70, N'30697615713', N'HILARION-ABASTOS', N'CARRERA 22 CON AVE. CARLOS SOUBLETTE #8-35', NULL, N'69761571', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (71, N'30698101985', N'BON APP', N'12, RUE DES BOUCHERS', NULL, N'69810198', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (72, N'30701749150', N'PICCOLO UND MEHR', N'GEISLWEG 14', NULL, N'70174915', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (73, N'30702221710', N'RATTLESNAKE CANYON GROCERY', N'2817 MILTON DR.', NULL, N'70222171', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (74, N'30703067898', N'REGGIANI CASEIFICI', N'STRADA PROVINCIALE 124', NULL, N'70306789', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (75, N'30707467254', N'HUNGRY COYOTE IMPORT STORE', N'CITY CENTER PLAZA 516 MAIN ST.  ', NULL, N'70746725', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (76, N'30707721509', N'LETS STOP N SHOP', N'87 POLK ST. SUITE 5', NULL, N'70772150', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (77, N'30709311049', N'QUEEN COZINHA', N'ALAMEDA DOS CANÀRIOS, 891', NULL, N'70931104', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (78, N'30709386642', N'BLAUER SEE DELIKATESSEN', N'FORSTERSTR. 57', NULL, N'70938664', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (79, N'30711570000', N'LAZY K KOUNTRY STORE', N'12 ORCHESTRA TERRACE', NULL, N'71157000', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (80, N'30712355944', N'ROMERO Y TOMILLO', N'GRAN VÍA, 1', NULL, N'71235594', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (81, N'31500094156', N'SUPRÊMES DÉLICES', N'BOULEVARD TIROU, 255', NULL, N'50009415', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (82, N'31560956904', N'MAISON DEWEY', N'RUE JOSEPH-BENS 532', NULL, N'56095690', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (83, N'31617999966', N'SAVE-A-LOT MARKETS', N'187 SUFFOLK LN.', NULL, N'61799996', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (84, N'31633008775', N'SPÉCIALITÉS DU MONDE', N'25, RUE LAURISTON', NULL, N'63300877', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (85, N'32544486183', N'SPLIT RAIL BEER & ALE', N'P.O. BOX 555', NULL, N'54448618', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (86, N'33500365019', N'WELLINGTON IMPORTADORA', N'RUA DO MERCADO, 12', NULL, N'50036501', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (87, N'33527019759', N'CENTRO COMERCIAL MOCTEZUMA  ', N'SIERRAS DE GRANADA 9993', NULL, N'52701975', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (88, N'33578212219', N'LEHMANNS MARKTSTAND', N'MAGAZINWEG 7', NULL, N'57821221', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (89, N'33582622945', N'SEVEN SEAS IMPORTS', N'90 WADHURST RD.', NULL, N'58262294', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (90, N'33708162219', N'HUNGRY OWL ALL-NIGHT GROCERS', N'8 JOHNSTOWN ROAD', NULL, N'70816221', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
INSERT [Venta].[Cliente] ([id_cliente], [cuit], [razon_social], [domicilio], [telefono], [dni], [mail], [fecha_alta]) VALUES (91, N'33708257589', N'LA MAISON DASIE', N'1 RUE ALSACE-LORRAINE', NULL, N'70825758', NULL, CAST(N'2022-09-10T20:07:00' AS SmallDateTime))
SET IDENTITY_INSERT [Venta].[Cliente] OFF
GO
ALTER TABLE [Sistema].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Banco_Cuenta] FOREIGN KEY([id_banco])
REFERENCES [Sistema].[Entidad_Bancaria] ([id_banco])
GO
ALTER TABLE [Sistema].[Cuenta] CHECK CONSTRAINT [FK_Banco_Cuenta]
GO
/****** Object:  StoredProcedure [Compra].[SP_Agrega_Producto_OC]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
DECLARE @e int
Execute Compra.SP_Agrega_Producto_OC 1,'CIT005','CROBION',1,25,1000,1500,1,@e
select * from produccion.producto
select * from produccion.empaque
select * from produccion.medida


*/



CREATE PROCEDURE [Compra].[SP_Agrega_Producto_OC](
	@id_orden_compra INT
	,@codigo_producto VARCHAR(10)
	,@marca VARCHAR (50)
	,@id_empaque int
	,@capacidad_envase int
	,@cantidad int
	,@monto float
	,@id_medida int

	,@error int out
	
)
AS
BEGIN
	DECLARE @id_orden_compra_producto int;

	
	SET @error=0;
	BEGIN TRANSACTION
		BEGIN TRY

			--======== SECCION DETALLE ORDEN COMPRA ================-inserto la relacion del lote con el producto
	


		
		
			INSERT INTO Compra.Orden_Compra_Producto(
				id_orden_compra
				,codigo_producto
				,marca
				,cantidad
				,monto
			)
			VALUES( 
				@id_orden_compra
				,@codigo_producto
				,@marca
				,@cantidad
				,@monto
			)



			SET @id_orden_compra_producto=SCOPE_IDENTITY();


			INSERT INTO Relacion.OC_Producto_Empaque(
				id_ocompra_producto
				,id_empaque
				,capacidad_envase
			)
			VALUES(
				@id_orden_compra_producto
				,@id_empaque
				,@capacidad_envase

			);

			INSERT INTO Relacion.OC_Producto_Medida(
				id_ocompra_producto
				,id_medida
			
			)
			VALUES(
				@id_orden_compra_producto
				,@id_medida
				
			);


			COMMIT;

		END TRY
		BEGIN CATCH
			set @error= @@error;
			ROLLBACK;
		END CATCH
END

GO
/****** Object:  StoredProcedure [Compra].[SP_Busca_Costo]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE   PROCEDURE [Compra].[SP_Busca_Costo]

 AS
	BEGIN TRY
			
			SELECT 
				nombre
			FROM
				Costo.Concepto_header
			WHERE
				id_tipo_concepto = 3
	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
--execute Compra.[SP_Busca_Flete]
GO
/****** Object:  StoredProcedure [Compra].[SP_Busca_Fecha_Inicial_Compra]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE   PROCEDURE [Compra].[SP_Busca_Fecha_Inicial_Compra]
 AS
	BEGIN TRY

				SELECT 
					isnull(convert(varchar(12),min(fecha),111),getdate()) fecha
				FROM
					compra.Orden_Compra;

	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
/*
execute compra.SP_Busca_Fecha_Inicial_Compra 


*/
GO
/****** Object:  StoredProcedure [Compra].[SP_Busca_Ordenes_Compra]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
DECLARE @f1 date
DECLARE @f2 date
DECLARE @monto float
DECLARE @costo float

set @f1=CONVERT(date,getdate()-1000,112)
set @f2=CONVERT(date,getdate()-365,112)

Execute Compra.SP_Busca_Ordenes_Compra 1 ,null,null,null,null,null,null,@monto,@costo
print @monto
print @costo


select * from compra.orden_compra
select * from compra.orden_compra_producto
*/



CREATE PROCEDURE [Compra].[SP_Busca_Ordenes_Compra]
	@id_orden_compra int NULL
	,@id_proveedor int null
	,@id_producto int null
	,@estado int NULL --Todos los estados
	,@vigente bit NULL --1 Solo vigente --> NULL --> Todos los estados -->0 Solo no vigentes
	,@fecha_inicio date  null
	,@fecha_fin date null
	,@monto_total float out
	,@flete_total float out

AS

	DECLARE @ordenes_compra TABLE(
		id_orden_compra int
		,fecha_compra date
		,nombre_producto varchar(30)
		,razon_social varchar(70)
		,id_estado int
		,fecha_cambio_estado date
		,id_vigente int
		,tipo_costo int
		,id_moneda int
		,id_tipo_envio int

	);


	
	BEGIN TRY

		SET @monto_total=(
						SELECT 
							SUM(monto)

						FROM
							compra.Orden_Compra_Producto
						WHERE
							id_orden_compra=@id_orden_compra);


		SET @flete_total=(
						SELECT 
							SUM(monto_flete)

						FROM
							relacion.Orden_Compra_Costo_Flete
						WHERE
							id_orden_compra=@id_orden_compra);


	IF( @id_orden_compra is not null)
		BEGIN
			INSERT INTO  @ordenes_compra(
					 id_orden_compra
					,fecha_compra 	
					,nombre_producto
					,razon_social 	
					,id_estado
					,fecha_cambio_estado
					,id_vigente
					,tipo_costo
					,id_moneda
					,id_tipo_envio
				)
				


			SELECT DISTINCT
				OC.id_orden_compra
				,OC.fecha
				,P.nombre_producto
				,PR.razon_social
				,RCE.id_estado
				,RCE.fecha
				,RCE.vigente
				,OCCF.id_flete
				,MO.id_moneda
				,OCE.id_envio



			FROM 
				Compra.Orden_Compra OC
				INNER JOIN Compra.Orden_Compra_Producto OCP ON OC.id_orden_compra=OCP.id_orden_compra
				INNER JOIN Produccion.Producto P ON OCP.id_producto=P.id_producto
				INNER JOIN Relacion.Proveedor_OrdenCompra POC ON OC.id_orden_compra=POC.id_orden_compra
				INNER JOIN Compra.Proveedor PR ON POC.id_proveedor=PR.id_proveedor
				INNER JOIN Relacion.Compra_Estado RCE ON OC.id_orden_compra=RCE.id_compra
				INNER JOIN Relacion.Orden_Compra_Costo_Flete OCCF ON OCCF.id_orden_compra=OC.id_orden_compra
				INNER JOIN Relacion.Moneda_Orden_Compra MO ON MO.id_orden_compra=OC.id_orden_compra
				INNER JOIN Relacion.Orden_Compra_Envio OCE ON OCE.id_orden_compra=OC.id_orden_compra
			WHERE
				OC.id_orden_compra=@id_orden_compra;
		

		END
	ELSE IF ( @id_proveedor is not null)
		BEGIN
			INSERT INTO  @ordenes_compra(
					 id_orden_compra
					,fecha_compra 	
					,nombre_producto
					,razon_social 	
					,id_estado
					,fecha_cambio_estado
					,id_vigente
					,tipo_costo
					,id_moneda
					,id_tipo_envio
				)
				


			SELECT DISTINCT
				OC.id_orden_compra
				,OC.fecha
				,P.nombre_producto
				,PR.razon_social
				,RCE.id_estado
				,RCE.fecha
				,RCE.vigente
				,OCCF.id_flete
				,MO.id_moneda
				,OCE.id_envio



			FROM 
				Compra.Orden_Compra OC
				INNER JOIN Compra.Orden_Compra_Producto OCP ON OC.id_orden_compra=OCP.id_orden_compra
				INNER JOIN Produccion.Producto P ON OCP.id_producto=P.id_producto
				INNER JOIN Relacion.Proveedor_OrdenCompra POC ON OC.id_orden_compra=POC.id_orden_compra
				INNER JOIN Compra.Proveedor PR ON POC.id_proveedor=PR.id_proveedor
				INNER JOIN Relacion.Compra_Estado RCE ON OC.id_orden_compra=RCE.id_compra
				INNER JOIN Relacion.Orden_Compra_Costo_Flete OCCF ON OCCF.id_orden_compra=OC.id_orden_compra
				INNER JOIN Relacion.Moneda_Orden_Compra MO ON MO.id_orden_compra=OC.id_orden_compra
				INNER JOIN Relacion.Orden_Compra_Envio OCE ON OCE.id_orden_compra=OC.id_orden_compra

			WHERE
				POC.id_proveedor=@id_proveedor;

		END

	ELSE IF ( @id_producto is not null)
		BEGIN

			INSERT INTO  @ordenes_compra(
					 id_orden_compra
					,fecha_compra 	
					,nombre_producto
					,razon_social 	
					,id_estado
					,fecha_cambio_estado
					,id_vigente
					,tipo_costo
					,id_moneda
					,id_tipo_envio
				)
				


			SELECT DISTINCT
				OC.id_orden_compra
				,OC.fecha
				,P.nombre_producto
				,PR.razon_social
				,RCE.id_estado
				,RCE.fecha
				,RCE.vigente
				,OCCF.id_flete
				,MO.id_moneda
				,OCE.id_envio



			FROM 
				Compra.Orden_Compra OC
				INNER JOIN Compra.Orden_Compra_Producto OCP ON OC.id_orden_compra=OCP.id_orden_compra
				INNER JOIN Produccion.Producto P ON OCP.id_producto=P.id_producto
				INNER JOIN Relacion.Proveedor_OrdenCompra POC ON OC.id_orden_compra=POC.id_orden_compra
				INNER JOIN Compra.Proveedor PR ON POC.id_proveedor=PR.id_proveedor
				INNER JOIN Relacion.Compra_Estado RCE ON OC.id_orden_compra=RCE.id_compra
				INNER JOIN Relacion.Orden_Compra_Costo_Flete OCCF ON OCCF.id_orden_compra=OC.id_orden_compra
				INNER JOIN Relacion.Moneda_Orden_Compra MO ON MO.id_orden_compra=OC.id_orden_compra
				INNER JOIN Relacion.Orden_Compra_Envio OCE ON OCE.id_orden_compra=OC.id_orden_compra

			WHERE
				P.id_producto=@id_producto;


		END

		ELSE
		BEGIN
			INSERT INTO  @ordenes_compra(
					 id_orden_compra
					,fecha_compra 	
					,nombre_producto
					,razon_social 	
					,id_estado
					,fecha_cambio_estado
					,id_vigente
					,tipo_costo
					,id_moneda
					,id_tipo_envio
				)
				


			SELECT DISTINCT
				OC.id_orden_compra
				,OC.fecha
				,P.nombre_producto
				,PR.razon_social
				,RCE.id_estado
				,RCE.fecha
				,RCE.vigente
				,OCCF.id_flete
				,MO.id_moneda
				,OCE.id_envio



			FROM 
				Compra.Orden_Compra OC
				INNER JOIN Compra.Orden_Compra_Producto OCP ON OC.id_orden_compra=OCP.id_orden_compra
				INNER JOIN Produccion.Producto P ON OCP.id_producto=P.id_producto
				INNER JOIN Relacion.Proveedor_OrdenCompra POC ON OC.id_orden_compra=POC.id_orden_compra
				INNER JOIN Compra.Proveedor PR ON POC.id_proveedor=PR.id_proveedor
				INNER JOIN Relacion.Compra_Estado RCE ON OC.id_orden_compra=RCE.id_compra
				INNER JOIN Relacion.Orden_Compra_Costo_Flete OCCF ON OCCF.id_orden_compra=OC.id_orden_compra
				INNER JOIN Relacion.Moneda_Orden_Compra MO ON MO.id_orden_compra=OC.id_orden_compra
				INNER JOIN Relacion.Orden_Compra_Envio OCE ON OCE.id_orden_compra=OC.id_orden_compra

		

		END



		IF(@vigente is not null)
			BEGIN

				DELETE FROM @ordenes_compra WHERE id_vigente!=@vigente;

			END

		IF(@estado is not null)
			BEGIN
				DELETE FROM @ordenes_compra WHERE id_estado!=@estado;

			END

		IF(@fecha_inicio is not null OR @fecha_fin is not null)
			BEGIN
				IF(@fecha_inicio is null) SET @fecha_inicio=CONVERT(date,getdate(),112)
				IF(@fecha_fin is null) SET @fecha_inicio=CONVERT(date,getdate(),112)
				
				DELETE FROM @ordenes_compra WHERE CONVERT(date,fecha_compra,112) not Between @fecha_inicio AND @fecha_fin

			END


		SELECT DISTINCT
			
			toc.id_orden_compra AS [Orden de Compra]
			,toc.fecha_compra AS [Fecha de creación]
			,toc.razon_social AS [Proveedor]
			,UPPER(E.descripcion) AS [Estado Orden Compra]
			,IIF(toc.id_vigente='0','CADUCADO','VIGENTE') AS [Status de Estado]
			,toc.fecha_cambio_estado as [Actualización de Estado]
			,M.descripcion AS [Moneda]
			,F.descripcion AS [Costo]
			,SE.descripcion AS [Medio Logistico]
			
			

		FROM  
			@ordenes_compra toc
			INNER JOIN Sistema.Estado E ON E.id_estado=toc.id_estado
			INNER JOIN sistema.Moneda M ON M.id_moneda=toc.id_moneda
			INNER JOIN Compra.Flete F ON F.id_flete=toc.tipo_costo
			INNER JOIN Sistema.Envio SE ON SE.id_envio=toc.id_tipo_envio

	END TRY
	
	BEGIN CATCH
		print @@ERROR;
		print ERROR_MESSAGE();
	END CATCH
	

	/*
	DECLARE @ordenes_compra TABLE(
		id_orden_compra int
		,fecha_compra varchar(10)
		,moneda varchar(3)
		,monto_total float
		,cantidad int
		,empaque varchar(40)
		,tipo_costo varchar(10)
		,monto_flete float
		,codigo_lote  varchar(10)
		,nombre_producto varchar(30)
		,razon_social varchar(70)
		,id_vigente bit
		,id_estado int

	);

	DECLARE @ordenes_compra_final TABLE(
		id_orden_compra int
		,fecha_compra varchar(10)
		,moneda varchar(3)
		,monto_total float
		,cantidad int
		,empaque varchar(40)
		,tipo_costo varchar(10)
		,monto_flete float
		,codigo_lote  varchar(10)
		,nombre_producto varchar(30)
		,razon_social varchar(70)
		,id_estado int
		,estado varchar(20)

	);
	

	IF(not @id_orden_compra is null)
			BEGIN
				INSERT INTO  @ordenes_compra(
					 id_orden_compra
					,fecha_compra 	
					,moneda 		
					,monto_total 	
					,cantidad 		
					,empaque 		
					,tipo_costo 	
					,monto_flete 	
					,codigo_lote  	
					,nombre_producto
					,razon_social 	
					,id_vigente
					,id_estado
				)
				
				SELECT
					oc.id_orden_compra
					,convert(varchar,oc.fecha,111) as [fecha compra]
					,m.nomenclatura as moneda
					,oc.monto_total 
					,oc.cantidad
					,e.descripcion as empaque
					,f.descripcion as [tipo costo]
					,occf.monto_flete
					,l.codigo_lote
					,p.nombre_producto
					,pr.razon_social
					,ce.vigente
					,ce.id_estado
				FROM 
					Compra.Orden_Compra oc
					INNER JOIN Relacion.Orden_Compra_Lote ocl ON ocl.id_orden_compra=oc.id_orden_compra
					INNER JOIN Compra.lote l ON l.id_batch=ocl.id_lote
					INNER JOIN Relacion.Lote_Producto lp ON lp.id_batch=l.id_batch
					INNER JOIN Produccion.Producto p ON p.id_producto=lp.id_producto
					INNER JOIN Relacion.Proveedor_OrdenCompra po ON po.id_orden_compra=oc.id_orden_compra
					INNER JOIN Compra.Proveedor pr ON pr.id_proveedor =po.id_proveedor
					INNER JOIN relacion.Lote_Empaque le ON le.id_batch=l.id_batch
					INNER JOIN Produccion.Empaque e ON e.id_empaque=le.id_empaque
					INNER JOIN relacion.Moneda_Orden_Compra moc ON moc.id_orden_compra=oc.id_orden_compra
					INNER JOIN Sistema.Moneda m ON m.id_moneda=moc.id_moneda
					INNER JOIN Relacion.Orden_Compra_Costo_Flete occf ON occf.id_orden_compra=oc.id_orden_compra
					INNER JOIN Compra.Flete f ON f.id_flete=occf.id_flete
					INNER JOIN Relacion.Compra_Estado ce ON ce.id_compra=oc.id_orden_compra
				
	
				WHERE oc.id_orden_compra =@id_orden_compra
					AND (convert(varchar,oc.fecha,111) BETWEEN convert(varchar,@fecha_inicio,111) AND convert(varchar,@fecha_fin,111));;
			END
	
			

	ELSE
		
		BEGIN
	
				INSERT INTO  @ordenes_compra(
					 id_orden_compra
					,fecha_compra 	
					,moneda 		
					,monto_total 	
					,cantidad 		
					,empaque 		
					,tipo_costo 	
					,monto_flete 	
					,codigo_lote  	
					,nombre_producto
					,razon_social 	
					,id_vigente
					,id_estado
				)
				
				SELECT
					oc.id_orden_compra
					,convert(varchar,oc.fecha,111) as [fecha compra]
					,m.nomenclatura as moneda
					,oc.monto_total 
					,oc.cantidad
					,e.descripcion as empaque
					,f.descripcion as [tipo costo]
					,occf.monto_flete
					,l.codigo_lote
					,p.nombre_producto
					,pr.razon_social
					,ce.vigente
					,ce.id_estado
				FROM 
					Compra.Orden_Compra oc
					INNER JOIN Relacion.Orden_Compra_Lote ocl ON ocl.id_orden_compra=oc.id_orden_compra
					INNER JOIN Compra.lote l ON l.id_batch=ocl.id_lote
					INNER JOIN Relacion.Lote_Producto lp ON lp.id_batch=l.id_batch
					INNER JOIN Produccion.Producto p ON p.id_producto=lp.id_producto
					INNER JOIN Relacion.Proveedor_OrdenCompra po ON po.id_orden_compra=oc.id_orden_compra
					INNER JOIN Compra.Proveedor pr ON pr.id_proveedor =po.id_proveedor
					INNER JOIN relacion.Lote_Empaque le ON le.id_batch=l.id_batch
					INNER JOIN Produccion.Empaque e ON e.id_empaque=le.id_empaque
					INNER JOIN relacion.Moneda_Orden_Compra moc ON moc.id_orden_compra=oc.id_orden_compra
					INNER JOIN Sistema.Moneda m ON m.id_moneda=moc.id_moneda
					INNER JOIN Relacion.Orden_Compra_Costo_Flete occf ON occf.id_orden_compra=oc.id_orden_compra
					INNER JOIN Compra.Flete f ON f.id_flete=occf.id_flete
					INNER JOIN Relacion.Compra_Estado ce ON ce.id_compra=oc.id_orden_compra
	
				WHERE	
					pr.razon_social LIKE('%' + @razon_social + '%')
					AND p.nombre_producto LIKE('%' + @nombre_producto + '%')
					AND l.codigo_lote LIKE('%' + @codigo_lote + '%')
					AND (convert(varchar,oc.fecha,111) BETWEEN convert(varchar,@fecha_inicio,111) AND convert(varchar,@fecha_fin,111));
			END
	

			IF(not @vigente is null)
				BEGIN
					
					INSERT INTO @ordenes_compra_final(

						 id_orden_compra 	
						,fecha_compra 		
						,moneda 			
						,monto_total 		
						,cantidad 			
						,empaque 			
						,tipo_costo 		
						,monto_flete 		
						,codigo_lote  		
						,nombre_producto	
						,razon_social 	
						,id_estado
						,estado

					)				
					SELECT
						 toc.id_orden_compra
						,toc.fecha_compra 	
						,toc.moneda 		
						,toc.monto_total 	
						,toc.cantidad 		
						,toc.empaque 		
						,toc.tipo_costo 	
						,toc.monto_flete 	
						,toc.codigo_lote  	
						,toc.nombre_producto
						,toc.razon_social 	
						,est.id_estado
						,UPPER(est.descripcion) as Estado_Actual
					FROM
						@ordenes_compra toc
						INNER JOIN Sistema.Estado est ON est.id_estado=toc.id_estado

					WHERE
						id_vigente=@vigente 

				END
			ELSE
				BEGIN
					INSERT INTO @ordenes_compra_final(

						 id_orden_compra 	
						,fecha_compra 		
						,moneda 			
						,monto_total 		
						,cantidad 			
						,empaque 			
						,tipo_costo 		
						,monto_flete 		
						,codigo_lote  		
						,nombre_producto	
						,razon_social 	
						,id_estado
						,estado

					)	
					SELECT
						 toc.id_orden_compra
						,toc.fecha_compra 	
						,toc.moneda 		
						,toc.monto_total 	
						,toc.cantidad 		
						,toc.empaque 		
						,toc.tipo_costo 	
						,toc.monto_flete 	
						,toc.codigo_lote  	
						,toc.nombre_producto
						,toc.razon_social 	
						,est.id_estado
						,UPPER(est.descripcion) as Estado_Actual
					FROM
						@ordenes_compra toc
						INNER JOIN Sistema.Estado est ON est.id_estado=toc.id_estado



				END
	
	
				IF(@estado is null)
					BEGIN
						SELECT
							id_orden_compra
							,fecha_compra 	
							,moneda 		
							,monto_total 	
							,cantidad 		
							,empaque 		
							,tipo_costo 	
							,monto_flete 	
							,codigo_lote  	
							,nombre_producto
							,razon_social 	
							,estado
						FROM
							@ordenes_compra_final;


					END
				ELSE
					BEGIN
						SELECT
							id_orden_compra
							,fecha_compra 	
							,moneda 		
							,monto_total 	
							,cantidad 		
							,empaque 		
							,tipo_costo 	
							,monto_flete 	
							,codigo_lote  	
							,nombre_producto
							,razon_social 	
							,estado
						FROM
							@ordenes_compra_final
						WHERE
							id_estado=@estado;

				END
	
	END TRY






	BEGIN CATCH
		print @@ERROR;
		print ERROR_MESSAGE();

	END CATCH
	*/
GO
/****** Object:  StoredProcedure [Compra].[SP_Busca_Ordenes_Compra_LIKE]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*

DECLARE @f1 date
DECLARE @f2 date


set @f1=CONVERT(date,getdate()-1,112)
set @f2=CONVERT(date,getdate(),112)
Execute Compra.SP_Busca_Ordenes_Compra_LIKE null,null,0,null, @f1, @f2

*/



CREATE PROCEDURE [Compra].[SP_Busca_Ordenes_Compra_LIKE]

	@razon_social varchar(70) NULL
	,@nombre_producto varchar(30) NULL
	,@estado int NULL --Todos los estados
	,@vigente bit NULL --1 Solo vigente --> NULL --> Todos los estados -->0 Solo no vigentes
	,@fecha_inicio date  NULL
	,@fecha_fin date  NULL
AS
	
	BEGIN TRY
	
	DECLARE @ordenes_compra TABLE(
		id_orden_compra int
		,fecha_compra date
		,nombre_producto varchar(30)
		,razon_social varchar(70)
		,id_estado int
		,fecha_cambio_estado date
		,id_vigente int
		,tipo_costo int
		,monto_costo float
		,id_moneda int
		,id_tipo_envio int

	);


			INSERT INTO  @ordenes_compra(
					 id_orden_compra
					,fecha_compra 	
					,nombre_producto
					,razon_social 	
					,id_estado
					,fecha_cambio_estado
					,id_vigente
					,tipo_costo
					,monto_costo
					,id_moneda
					,id_tipo_envio
			)
			SELECT DISTINCT
				OC.id_orden_compra
				,OC.fecha
				,P.nombre_producto
				,PR.razon_social
				,RCE.id_estado
				,RCE.fecha
				,RCE.vigente
				,COC.id_concepto
				,isnull(COC.monto,0)
				,MO.id_moneda
				,OCE.id_envio



			FROM 
				Compra.Orden_Compra OC
				INNER JOIN Compra.Orden_Compra_Producto OCP ON OC.id_orden_compra=OCP.id_orden_compra
				INNER JOIN Produccion.Producto_header P ON OCP.codigo_producto=P.codigo_producto
				INNER JOIN Relacion.Proveedor_OrdenCompra POC ON OC.id_orden_compra=POC.id_orden_compra
				INNER JOIN Compra.Proveedor PR ON POC.id_proveedor=PR.id_proveedor
				INNER JOIN Relacion.Compra_Estado RCE ON OC.id_orden_compra=RCE.id_compra
				INNER JOIN Relacion.costo_oc COC ON COC.id_orden_compra=OC.id_orden_compra
				INNER JOIN Relacion.Moneda_Orden_Compra MO ON MO.id_orden_compra=OC.id_orden_compra
				INNER JOIN Relacion.Orden_Compra_Envio OCE ON OCE.id_orden_compra=OC.id_orden_compra



				WHERE	
					pr.razon_social LIKE('%' + IIF(@razon_social is null,'',@razon_social) + '%')
					AND p.nombre_producto  LIKE('%' + IIF(@nombre_producto is null,'',@nombre_producto) + '%')
					AND	(convert(date,oc.fecha,112) BETWEEN convert(date,@fecha_inicio,112) AND convert(date,@fecha_fin,112));

	

		IF(@vigente is not null)
			BEGIN

				DELETE FROM @ordenes_compra WHERE id_vigente!=@vigente;

			END

		IF(@estado is not null)
			BEGIN
				DELETE FROM @ordenes_compra WHERE id_estado!=@estado;

			END

		IF(@fecha_inicio is not null OR @fecha_fin is not null)
			BEGIN
				IF(@fecha_inicio is null) SET @fecha_inicio=CONVERT(date,getdate(),112)
				IF(@fecha_fin is null) SET @fecha_inicio=CONVERT(date,getdate(),112)
				
				DELETE FROM @ordenes_compra WHERE CONVERT(date,fecha_compra,112) not Between @fecha_inicio AND @fecha_fin

			END


		SELECT DISTINCT
			
			toc.id_orden_compra AS [Orden de Compra]
			,toc.fecha_compra AS [Fecha de creación]
			,toc.razon_social AS [Proveedor]
			,UPPER(E.descripcion) AS [Estado Orden Compra]
			,IIF(toc.id_vigente='0','CADUCADO','VIGENTE') AS [Status de Estado]
			,toc.fecha_cambio_estado as [Actualización de Estado]
		 	,M.descripcion AS [Moneda]
		 	,C.nombre AS [Tipo de Costo]
			,IIF(toc.monto_costo=0,'PENDIENTE',convert(varchar,toc.monto_costo)) AS [Monto de Costo]
		 	,SE.descripcion AS [Medio Logistico]
			
			

		FROM  
			@ordenes_compra toc
		 	INNER JOIN Sistema.Estado E ON E.id_estado=toc.id_estado
		 	INNER JOIN sistema.Moneda M ON M.id_moneda=toc.id_moneda
		 	INNER JOIN Costo.Concepto_Header C ON C.id_concepto_header=toc.tipo_costo
		 	INNER JOIN Sistema.Envio SE ON SE.id_envio=toc.id_tipo_envio;


	
	END TRY






	BEGIN CATCH
		print @@ERROR;
		print ERROR_MESSAGE();

	END CATCH

GO
/****** Object:  StoredProcedure [Compra].[SP_Busca_Proveedor]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like


CREATE  PROCEDURE [Compra].[SP_Busca_Proveedor]
	@razon_social varchar(30) NULL
	,@ciudad varchar(20) NULL
	,@estado varchar(20) NULL
	,@pais varchar(60) NULL
 AS

	

	BEGIN TRY


		
			SELECT 
				p.id_proveedor AS 'ID PROVEEDOR'
				,p.razon_social AS 'RAZON SOCIAL'
				,p.domicilio AS 'DOMICILIO'
				--,p.prefijo_telefonico+i.telefono AS 'TELEFONO'
				,p.mail AS 'CORREO ELECTRONICO'
				,c.nombre AS 'CIUDAD'
				,dp.nombre AS 'ESTADO-PROVINCIA'
				,pa.nombre AS 'PAIS'
				,cc.nombre AS 'CONTINENTE'

				
			FROM
				Compra.Proveedor p
				INNER JOIN Relacion.Proveedor_Ciudad ric ON ric.id_proveedor=p.id_proveedor
				INNER JOIN Sistema.Ciudad c ON c.id_ciudad=ric.id_ciudad
				INNER JOIN Relacion.DP_Ciudad rdpc ON rdpc.id_ciudad=c.id_ciudad
				INNER JOIN Sistema.Division_Politica dp ON dp.id_division_politica=rdpc.id_division_politica
				INNER JOIN Relacion.Pais_DP rpdp ON rpdp.id_division_politica=dp.id_division_politica
				INNER JOIN Sistema.Pais pa ON pa.id_pais=rpdp.id_pais
				INNER JOIN Relacion.Pais_Continente rpc ON rpc.id_pais=pa.id_pais
				INNER JOIN Sistema.Continente cc ON cc.id_continente=rpc.id_continente
		
			WHERE p.razon_social LIKE('%' + @razon_social + '%')
				AND c.nombre LIKE('%' + @ciudad + '%')
				AND dp.nombre LIKE('%' + @estado + '%')
				AND pa.nombre LIKE('%' + @pais + '%')

			ORDER BY
				p.id_proveedor
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
--execute Importacion.SP_busca_Importador '','','',''
--select * from produccion.producto

GO
/****** Object:  StoredProcedure [Compra].[SP_Cambia_Estado_OC]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXECUTE Compra.Cambia_Estado_OC 1

CREATE PROCEDURE [Compra].[SP_Cambia_Estado_OC]
	@id_orden_compra int
	,@id_estado int
	,@fecha_cambio date
	,@impacta bit out

AS
	DECLARE @id_estado_parametro int;
	SET @impacta=0;
	BEGIN TRANSACTION
		BEGIN TRY
		--DECLARE @estado_actual int

		--SET @estado_actual=(SELECT max(id_estado) FROM Relacion.Compra_Estado where id_compra=@id_orden_compra);

		--IF(@estado_actual<(SELECT max(id_estado) FROM Sistema.Estado))
		--BEGIN[Compra].[SP_Busca_Flete]
			
			SET @id_estado_parametro=(
										SELECT
											valor
										FROM
											Parametro.Compra
										WHERE
											id_parametro=1
									);


			IF(@id_estado=@id_estado_parametro) 
			BEGIN
				SET @impacta=1;
				--EXECUTE Produccion.SP_Impactar_Stock;

			END;
			
			UPDATE Relacion.Compra_Estado 
			SET vigente=0
			WHERE id_compra=@id_orden_compra;

			-- INSERTO EL ESTADO EN EL SIGUIENTE
			INSERT INTO  Relacion.Compra_Estado(
					id_compra
					,id_estado
					,fecha
					,vigente
				)
			VALUES(
					@id_orden_compra
					,@id_estado
			--		,(SELECT max(id_estado) FROM Relacion.Compra_Estado where id_compra=@id_orden_compra)+1
					,CONVERT(date, @fecha_cambio,112)
			--		,getdate()
					,1
				);

			

		--END
		COMMIT;

	END TRY

	BEGIN CATCH
		print @@ERROR;
		print ERROR_MESSAGE();
		ROLLBACK;

	END CATCH
	/*
	truncate table relacion.compra_estado
	truncate table Compra.Orden_compra
	truncate table compra.orden_compra_producto
	truncate table  Relacion.OC_Producto_Medida
	truncate table  Relacion.OC_Producto_Empaque
	truncate table  Relacion.Moneda_Orden_Compra
	truncate table  Relacion.Orden_Compra_Costo_Flete
	truncate table Relacion.Proveedor_OrdenCompra
	truncate table  Relacion.Orden_Compra_Envio
	*/
GO
/****** Object:  StoredProcedure [Compra].[SP_Carga_Costo]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Compra].[SP_Carga_Costo](
	@id_orden_compra int
	,@monto_flete float
)
AS
	BEGIN TRANSACTION
	BEGIN TRY


		UPDATE Relacion.Orden_Compra_Costo_Flete SET monto_flete=@monto_flete WHERE id_orden_compra=@id_orden_compra;
		COMMIT;

	END TRY
	BEGIN CATCH
		ROLLBACK;

	END CATCH
GO
/****** Object:  StoredProcedure [Compra].[SP_Genera_OC]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like
/*
declare @oc int
execute compra.sp_genera_oc 1,1,1,1,1,@oc

	




truncate table compra.orden_compra
delete from compra.lote where id_batch>1000

[Produccion].[SP_Fabricar_Producto]
select * from  compra.orden_compra
select * from compra.orden_compra_producto
select * from compra.Proveedor
select * from sistema.moneda
select * from sistema.medio_pago
select * from compra.flete
select * from sistema.estado
select * from sistema.envio

*/

CREATE  PROCEDURE [Compra].[SP_Genera_OC]
	@id_proveedor int
	,@id_moneda int
	,@id_medio_envio int
	,@id_medio_pago int
	,@id_concepto_costo int

	,@id_orden_compra int OUT --SI HAY ERROR ES CERO
	


 AS
	


	
 	BEGIN TRANSACTION
		BEGIN TRY
			
			
			
			--Inserto la compra
			INSERT INTO Compra.Orden_Compra(
				fecha
	
	
			)
			VALUES(
					getdate()

			);

		

			SET @id_orden_compra=SCOPE_IDENTITY();
			
			INSERT INTO Relacion.Moneda_Orden_Compra(
				id_moneda
				,id_orden_compra
			
			)
			VALUES
			(
				@id_moneda
				,@id_orden_compra
			);

			INSERT INTO Relacion.Orden_Compra_Envio(
				id_orden_compra
				,id_envio
			)
			VALUES
			(
				@id_orden_compra
				,@id_medio_envio
			);
			
			INSERT INTO Relacion.Medio_Pago_Orden_Compra(
				id_orden_compra
				,id_medio_pago
			)
			VALUES
			(
				@id_orden_compra
				,@id_medio_pago
			);
	

			INSERT INTO Relacion.Costo_oc(
				id_concepto
				,id_orden_compra

		
			)
			VALUES
			(	
				@id_concepto_costo
				,@id_orden_compra
				
			);
		

			-- INSERTO EL ESTADO EN "ABIERTA" --> 0
			INSERT INTO Relacion.Compra_Estado(
				id_compra
				,id_estado
				,fecha
				,vigente
			)
			VALUES(
				@id_orden_compra
				,0
				,getdate()
				,1
			);

			--Inserto la relacion proveedor_ordenCompra

			INSERT INTO Relacion.Proveedor_OrdenCompra(
				id_proveedor
				,id_orden_compra
				
			)
			VALUES(
				@id_proveedor
				,@id_orden_compra
			);
		

			

			COMMIT;
		END TRY

		BEGIN CATCH
			set @id_orden_compra= 0;
			ROLLBACK;


		END CATCH



	
GO
/****** Object:  StoredProcedure [Compra].[SP_Ingresar_Proveedor]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE  PROCEDURE [Compra].[SP_Ingresar_Proveedor]
	@razon_social varchar(70) 
	,@domicilio varchar(40) 
	,@telefono varchar(20) 
	,@fax varchar(20)
	,@mail varchar(40) 
	,@id_ciudad int


 AS
	--DECLARE @id_importador int

	
	BEGIN TRANSACTION
		BEGIN TRY

			INSERT INTO Compra.Proveedor(
				razon_social
				,domicilio
				,telefono
				,fax
				,mail
				)
			VALUES(
				@razon_social
				,@domicilio
				,@telefono
				,@fax
				,@mail
				)
			
			INSERT INTO Relacion.Proveedor_Ciudad(
				id_proveedor
				,id_ciudad
				)
			VALUES(
				SCOPE_IDENTITY()
				,@id_ciudad
				)




				

			COMMIT;
		END TRY
		BEGIN CATCH
			print @@ERROR;

			ROLLBACK;

		END CATCH
--execute Importacion.SP_busca_Importador '','','',''
--select * from produccion.producto

GO
/****** Object:  StoredProcedure [Compra].[SP_Monto_OC]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--execute Compra.SP_Monto_OC 17

CREATE PROCEDURE [Compra].[SP_Monto_OC]
	@id_orden_compra int
	,@monto  float out

AS

	
	BEGIN TRY

		SET @monto=(	

		SELECT 
			
			sum(monto*cantidad) as 'MONTO' --+(iif(ocp.derecho_importacion is null,0,ocp.derecho_importacion))) as 'MONTO'
			
		FROM 
			Compra.Orden_Compra OC
			INNER JOIN Compra.Orden_Compra_Producto OCP ON OCP.id_orden_compra=OC.id_orden_compra
			INNER JOIN Relacion.Compra_Estado E ON E.id_compra=OC.id_orden_compra


		WHERE	
			oc.id_orden_compra=@id_orden_compra 
			AND E.vigente=1
		
		);

	END TRY

	BEGIN CATCH
		SET @monto=0;
		print @@ERROR;
		print ERROR_MESSAGE();
	END CATCH


	select * from Compra.Orden_Compra_Producto
GO
/****** Object:  StoredProcedure [Compra].[SP_Orden_Compra_Detalle]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXECUTE Compra.SP_Orden_Compra_Detalle 1
--select * from produccion.producto

CREATE PROCEDURE [Compra].[SP_Orden_Compra_Detalle]
	@id_orden_compra int 
	

AS
	BEGIN TRY
	
		
	    
		

		SELECT 
			--oc.id_orden_compra,
			p.codigo_producto as 'CODIGO DE PRODUCTO'
			,p.nombre_producto as 'NOMBRE DE PRODUCTO'
			,ocp.marca as 'MARCA'
			,(select nombre FROM sistema.pais WHERE id_pais=(Select DISTINCT id_pais from Produccion.Producto_Marca Where marca=ocp.marca and codigo_producto=ocp.codigo_producto)) as 'ORIGEN'
			,OCP.cantidad as 'CANTIDAD'
			,M.descripcion as 'MEDIDA'
			,OCP.monto as 'MONTO UNITARIO'
			,(OCP.monto * OCP.cantidad) as 'SUB TOTAL'
			,IIF(OCP.derecho_importacion is null,'PENDIENTE',convert(varchar,OCP.derecho_importacion)) AS [Derecho Importacion]
			,IIF(OCP.derecho_importacion is not null,convert(varchar,(OCP.monto * OCP.cantidad)+OCP.derecho_importacion),'PENDIENTE') AS [TOTAL]
			,E.descripcion as 'EMPAQUE'
			,OPE.capacidad_envase  as 'VOLUMEN DE EMPAQUE'
			
		FROM 
			Compra.Orden_Compra OC
			INNER JOIN Compra.Orden_Compra_Producto OCP ON OCP.id_orden_compra=OC.id_orden_compra
			INNER JOIN Produccion.Producto_header P ON P.codigo_producto=OCP.codigo_producto
			INNER JOIN Relacion.OC_Producto_Medida OPM ON OPM.id_ocompra_producto=OCP.id_ocompra_producto
			INNER JOIN Produccion.Medida M ON M.id_medida=OPM.id_medida
			INNER JOIN Relacion.OC_Producto_Empaque OPE ON OPE.id_ocompra_producto=OCP.id_ocompra_producto
			INNER JOIN Produccion.Empaque E ON E.id_empaque=OPE.id_empaque
			


		WHERE	
			oc.id_orden_compra=@id_orden_compra

	END TRY

	BEGIN CATCH

		print @@ERROR;
		print ERROR_MESSAGE();
	END CATCH
GO
/****** Object:  StoredProcedure [Compra].[SP_Orden_Compra_Detalle_Cuarentena]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXECUTE Compra.SP_Orden_Compra_Detalle 1
--select * from produccion.producto

CREATE PROCEDURE [Compra].[SP_Orden_Compra_Detalle_Cuarentena]
	@id_orden_compra int 
	,@codigo_producto varchar(30)

AS
	BEGIN TRY
	

		
		select
			l.codigo_lote as 'CODIGO DE LOTE'
			,pp.codigo_producto  as 'CODIGO DE PRODUCTO'
			,pp.marca as 'MARCA'
			,pp.fecha_elaboracion as 'FECHA DE ELABORACION'
			,pp.fecha_vencimiento as 'FECHA DE VENCIMIENTO'
			,lp.cantidad as 'CANTIDAD'
			
		from 
			
			relacion.Lote_Producto  lp
			INNER JOIN produccion.producto pp ON pp.id_producto=lp.id_producto
			INNER JOIN compra.lote l ON l.id_batch=lp.id_batch
			INNER JOIN relacion.Orden_Compra_Lote ocl ON ocl.id_lote=l.id_batch
		where
			lp.cuarentena=1
			and	ocl.id_orden_compra=@id_orden_compra
			and pp.codigo_producto=@codigo_producto;

	END TRY

	BEGIN CATCH

		print @@ERROR;
		print ERROR_MESSAGE();
	END CATCH
GO
/****** Object:  StoredProcedure [Compra].[SP_Orden_Compra_Producto]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXECUTE Compra.SP_Orden_Compra_Detalle 1
--select * from produccion.producto

CREATE PROCEDURE [Compra].[SP_Orden_Compra_Producto]
	@id_orden_compra int 
	,@codigo_producto varchar(30)

AS
	BEGIN TRY
	
		
	    
		

		SELECT 
			--oc.id_orden_compra,
			p.codigo_producto as 'CODIGO DE PRODUCTO'
			,p.nombre_producto as 'NOMBRE DE PRODUCTO'
			,ocp.marca as 'MARCA'
			,(select nombre FROM sistema.pais WHERE id_pais=(Select DISTINCT id_pais from Produccion.Producto_Marca Where marca=ocp.marca)) as 'ORIGEN'
			,OCP.cantidad as 'CANTIDAD'
			,M.descripcion as 'MEDIDA'
			,OCP.monto as 'MONTO UNITARIO'
			,(OCP.monto * OCP.cantidad) as 'SUB TOTAL'
			,E.descripcion as 'EMPAQUE'
			,OPE.capacidad_envase  as 'VOLUMEN DE EMPAQUE'
			
		FROM 
			Compra.Orden_Compra OC
			INNER JOIN Compra.Orden_Compra_Producto OCP ON OCP.id_orden_compra=OC.id_orden_compra
			INNER JOIN Produccion.Producto_header P ON P.codigo_producto=OCP.codigo_producto
			INNER JOIN Relacion.OC_Producto_Medida OPM ON OPM.id_ocompra_producto=OCP.id_ocompra_producto
			INNER JOIN Produccion.Medida M ON M.id_medida=OPM.id_medida
			INNER JOIN Relacion.OC_Producto_Empaque OPE ON OPE.id_ocompra_producto=OCP.id_ocompra_producto
			INNER JOIN Produccion.Empaque E ON E.id_empaque=OPE.id_empaque
		


		WHERE	
			oc.id_orden_compra=@id_orden_compra
			and p.codigo_producto=@codigo_producto;
	END TRY

	BEGIN CATCH

		print @@ERROR;
		print ERROR_MESSAGE();
	END CATCH
GO
/****** Object:  StoredProcedure [Costo].[Calculador_Costo_Compra]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Costo].[Calculador_Costo_Compra]
	@id_orden_compra int
--	,@monto_costo float
	--,@monto_final float out
AS

	
	
	DECLARE @tabla_productos TABLE(codigo_producto nvarchar(10),monto float)
	
	BEGIN TRANSACTION


		BEGIN TRY
		--	UPDATE Relacion.Costo_oc SET monto=@monto_costo WHERE id_orden_compra=@id_orden_compra;
		/*	
			INSERT INTO 
				@tabla_orden --ORDEN DE CALCULO POR PERFIL
			SELECT
				PC.id_perfil_costo
			FROM
				Costo.Secuencia_Perfil SP
				INNER JOIN Costo.perfil_costo PC ON PC.id_perfil_costo=SP.id_perfil_costo
			ORDER BY
				orden
		*/

			INSERT INTO 
				@tabla_productos --DERECHOS DE IMPORTACION
			SELECT 
				ocp.codigo_producto
				,(ocp.monto*ocp.cantidad)*(dip.tasa/100)
			FROM
				Compra.Orden_Compra oc
				INNER JOIN Compra.Orden_Compra_Producto ocp ON ocp.id_orden_compra=oc.id_orden_compra
				INNER JOIN Produccion.Producto_Header ph ON ph.codigo_producto=ocp.codigo_producto
				INNER JOIN Relacion.Derecho_importacion_Producto dip ON dip.codigo_producto=ph.codigo_producto
			WHERE
				oc.id_orden_compra=@id_orden_compra ;
			
			UPDATE 
				Compra.Orden_Compra_Producto
			SET 
				derecho_importacion = t.monto
			FROM 
				compra.orden_compra_producto AS ocp
				JOIN @tabla_productos AS t ON ocp.codigo_producto = t.codigo_producto
			WHERE
				ocp.id_orden_compra=@id_orden_compra;
				
			
			
			DECLARE @veintidos int;
			
			SET @veintidos=(
					SELECT DISTINCT 
						orden
					FROM 
						Proceso.costo_a_calcular
					WHERE 
						id_orden_compra=@id_orden_compra
						AND id_concepto_header=22)

			DELETE FROM 
				Proceso.costo_a_calcular 
			WHERE 
				orden=@veintidos 
				AND id_orden_compra=@id_orden_compra

			INSERT INTO	Proceso.Costo_a_Calcular(
				id_orden_compra
				,orden
				,id_concepto_header
				,id_tipo_valor
				,valor)
			VALUES(
				@id_orden_compra
				,@veintidos
				,22
				,1
				,(SELECT SUM(derecho_importacion) 
					FROM Compra.Orden_Compra_Producto
					WHERE id_orden_compra=@id_orden_compra))

			

		

			
				DECLARE @auxiliar_monto float=0;
				DECLARE @IdTipoValor INT, @Valor DECIMAL(18, 2);

				DECLARE cursorValores CURSOR FOR
				SELECT id_tipo_valor, valor
				FROM proceso.costo_a_calcular

				ORDER BY orden;  -- Orden de aparición

				OPEN cursorValores;

				FETCH NEXT FROM cursorValores INTO @IdTipoValor, @Valor;

				WHILE @@FETCH_STATUS = 0
				BEGIN
		
					IF @IdTipoValor = 1
						BEGIN
							-- Valor nominal
							SET @auxiliar_monto = @auxiliar_monto + @Valor;
				
						END
					ELSE
					BEGIN
						-- Valor porcentual
						SET @auxiliar_monto = @auxiliar_monto* (1 + (@Valor / 100.0));
						

					END

				FETCH NEXT FROM cursorValores INTO @IdTipoValor, @Valor;
			END;
			UPDATE Relacion.Costo_oc SET monto=@auxiliar_monto WHERE id_orden_compra=@id_orden_compra;
			DEALLOCATE cursorValores;







		
			COMMIT
		END TRY
		BEGIN CATCH
			print @@error
			ROLLBACK
		END CATCH
GO
/****** Object:  StoredProcedure [Costo].[Impacta_Valor_Carga]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Costo].[Impacta_Valor_Carga]
	@id_orden_compra int
	,@id_concepto_header int
	,@valor float
AS
BEGIN TRANSACTION
	BEGIN TRY
		UPDATE
			Proceso.Costo_a_Calcular
		SET
			valor=@valor
		WHERE
			id_orden_compra=@id_orden_compra
			AND id_concepto_header=@id_concepto_header;

		COMMIT;
	END TRY
	BEGIN CATCH
		print @@error
		ROLLBACK;
	END CATCH
	
GO
/****** Object:  StoredProcedure [Costo].[SP_Agregar_Concepto_Perfil_Costo]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [Costo].[SP_Agregar_Concepto_Perfil_Costo]
	@id_perfil_costo int
	,@id_concepto int
	,@id_enlace_concepto int
AS

	BEGIN TRAN
		BEGIN TRY
			INSERT INTO relacion.Perfil_Concepto(
				id_perfil_costo
				,id_concepto_header
				,enlace_concepto)
			VALUES(
				@id_perfil_costo
				,@id_concepto
				,@id_enlace_concepto)

		

			COMMIT
		END TRY
		BEGIN CATCH
			ROLLBACK
			print @@error
		END CATCH
GO
/****** Object:  StoredProcedure [Costo].[SP_Agregar_Perfil_Costo]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [Costo].[SP_Agregar_Perfil_Costo]
	@nombre VARCHAR(20)
	,@descripcion VARCHAR(200)
	,@id_perfil_costo int OUT
AS
	BEGIN TRAN
		BEGIN TRY
			INSERT INTO costo.perfil_costo(
				nombre
				,descripcion
				,fecha_creacion
				,vigente)
			VALUES(
				@nombre
				,@descripcion
				,getdate(),1);

			SET @id_perfil_costo=SCOPE_IDENTITY();
			/*ESTE INSERT ES PARA QUE EN FUTURO
			SE PUEDA CARGAR VARIOS PERFILES Y RELACIONARLOS ENTRE SI
			CON UN ORDEN DE EJECUCION*/

			INSERT INTO costo.Secuencia_Perfil(
				id_perfil_costo
				,orden)
			VALUES(
				@id_perfil_costo
				,1
			)


			COMMIT
		END TRY
		BEGIN CATCH
			ROLLBACK
			print @@error
		END CATCH

GO
/****** Object:  StoredProcedure [Costo].[SP_Busca_Concepto_Arancelario]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [Costo].[SP_Busca_Concepto_Arancelario]

AS

BEGIN TRY

	SELECT
		ch.id_concepto_header
		,tic.descripcion
		,ch.nombre
		,ch.descripcion
		,IIF(tc.valor is not null,
			IIF(tv.id_tipo_concepto=2,'% '+Convert(varchar,tc.valor),'USD '+Convert(varchar,tc.valor))
			,'CARGAR') as Gravamen

		
	FROM
		Costo.Concepto_Header ch
		LEFT JOIN Costo.Tasa_concepto tc ON tc.id_concepto_header=ch.id_concepto_header
		INNER JOIN Costo.tipo_concepto tic ON tic.id_tipo_concepto=ch.id_tipo_concepto
		INNER JOIN Costo.Tipo_Valor tv ON tv.id_tipo_concepto=ch.id_tipo_valor




END TRY
BEGIN CATCH
	print @@error;
END CATCH
GO
/****** Object:  StoredProcedure [Costo].[SP_Busca_Detalle_Perfil_Costo]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Costo].[SP_Busca_Detalle_Perfil_Costo]
	@id_perfil_costo int
	,@id_orden_compra int
	
AS

BEGIN TRY
	


	DECLARE @costos_a_calcular TABLE(
									orden int
									,id_concepto_header int
									,nombre varchar(20)
									,tipo_valor varchar(40)
									,valor float) 


	INSERT INTO @costos_a_calcular(
									id_concepto_header
									,nombre
									,tipo_valor
									,valor)

	SELECT 
		CH.id_concepto_header
		,CH.nombre
		,(SELECT descripcion FROM Costo.Tipo_Valor WHERE id_tipo_concepto=CH.id_tipo_valor) as Valor
		,tc.valor
	FROM
		costo.perfil_costo PC
		INNER JOIN relacion.Perfil_Concepto RPC ON RPC.id_perfil_costo=PC.id_perfil_costo
		INNER JOIN Costo.Concepto_Header CH ON CH.id_concepto_header=rpc.id_concepto_header
		LEFT JOIN Costo.Tasa_Concepto TC ON  TC.id_concepto_header=CH.id_concepto_header
	WHERE
		PC.vigente=1
		AND PC.id_perfil_costo=@id_perfil_costo
		AND CH.id_concepto_header!=22;



	INSERT INTO @costos_a_calcular(
								id_concepto_header
								,nombre
								,tipo_valor
								,valor)
	SELECT 
		22
		, dip.codigo_producto
		,'DIMP - Porcentual'
		,dip.tasa
	FROM
		compra.Orden_Compra_Producto ocp
		INNER JOIN relacion.Derecho_importacion_Producto DIP ON DIP.codigo_producto=ocp.codigo_producto
	WHERE
		ocp.id_orden_compra=@id_orden_compra
	

	




	
	-- Actualizar la columna "orden" en la variable de tabla
	BEGIN TRANSACTION
		UPDATE t
		SET t.orden = rn
		FROM @costos_a_calcular t
		INNER JOIN (
					SELECT id_perfil_costo, id_concepto_header, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
					FROM Relacion.Perfil_Concepto
					) p ON p.id_concepto_header = t.id_concepto_header;
		COMMIT;
	IF(@id_orden_compra!=0)
	BEGIN
		BEGIN TRANSACTION
			INSERT INTO Proceso.Costo_a_Calcular(
				id_orden_compra
				,id_concepto_header
				,orden
				,id_tipo_valor
				,valor)
			select 
				@id_orden_compra
				,id_concepto_header
				,orden
				,IIF(tipo_valor='Nominal',1,2) 
				,valor
			from @costos_a_calcular order by orden;
		COMMIT;
	END
	select 
		id_concepto_header
		,nombre
		,tipo_valor
		,valor
	from @costos_a_calcular order by orden;

END TRY
BEGIN CATCH
	ROLLBACK
	print @@error;
END CATCH


--execute [Costo].[SP_Busca_Detalle_Perfil_Costo] 1,1


GO
/****** Object:  StoredProcedure [Costo].[SP_Busca_Id_Enlace]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Costo].[SP_Busca_Id_Enlace]
	@nombre varchar(20)
	,@id_enlace int out

	
AS

BEGIN TRY
	SET @id_enlace=(SELECT
						id_concepto_header
					FROM
						costo.Concepto_Header 
					WHERE
						nombre=@nombre);
END TRY
BEGIN CATCH
	print @@error;
END CATCH
GO
/****** Object:  StoredProcedure [Costo].[SP_Busca_Perfil_Costo]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Costo].[SP_Busca_Perfil_Costo]
	@id_enlace_concepto int

	
AS

BEGIN TRY
	SELECT DISTINCT
		
		PC.nombre
		,PC.Descripcion
		,PC.id_perfil_costo
	FROM
		costo.perfil_costo PC
		INNER JOIN relacion.Perfil_Concepto RPC ON RPC.id_perfil_costo=PC.id_perfil_costo
	
	WHERE
		PC.vigente=1
		AND RPC.enlace_concepto=@id_enlace_concepto
END TRY
BEGIN CATCH
	print @@error;
END CATCH
GO
/****** Object:  StoredProcedure [Costo].[SP_Busca_Perfil_Costo_Generico]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC costo.SP_Busca_Perfil_Costo_Generico 1

CREATE  procedure [Costo].[SP_Busca_Perfil_Costo_Generico]
	@vigente int

	
AS

BEGIN TRY
	IF @vigente=1
		BEGIN
			SELECT DISTINCT
				PC.id_perfil_costo
				,PC.nombre
				,PC.Descripcion
				,PC.fecha_creacion
			FROM
				costo.perfil_costo PC
	
	
			WHERE
				PC.vigente=1;
		END
	ELSE
		BEGIN
			SELECT DISTINCT
				PC.id_perfil_costo
				,PC.nombre
				,PC.Descripcion
				,PC.fecha_creacion
				,IIf(PC.fecha_baja is null,'VIGENTE',convert(varchar,pc.fecha_baja,112)) as 'Fecha de Baja'
			FROM
				costo.perfil_costo PC;
	
	
		

		END

END TRY
BEGIN CATCH
	print @@error;
END CATCH
GO
/****** Object:  StoredProcedure [Costo].[SP_Detalle_Costo_Manual]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Costo].[SP_Detalle_Costo_Manual]
	@id_concepto_costo int
	,@es_manual int out
	
AS

BEGIN TRY
	
	SET @es_manual=(SELECT 
						count(PH.id_concepto_header)
						
					FROM
						costo.Concepto_Header PH
						INNER JOIN Costo.tasa_concepto TC ON TC.id_concepto_header=PH.id_concepto_header
				
					WHERE
					
						PH.id_concepto_header=@id_concepto_costo);
	IF(@es_manual=0)
	BEGIN
		SET @es_manual=(SELECT 
							count(PH.id_concepto_header)
						
						FROM
							costo.Concepto_Header PH
						
							INNER JOIN relacion.Derecho_importacion_Producto DIP ON DIP.id_concepto=PH.id_concepto_header
						
						WHERE
					
							PH.id_concepto_header=@id_concepto_costo);
	 END
END TRY
BEGIN CATCH
	print @@error;
END CATCH
GO
/****** Object:  StoredProcedure [Parametro].[SP_Busca_Valor_Ruta]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Parametro].[SP_Busca_Valor_Ruta]
	@id_ruta int
	,@ruta varchar(60) OUT
AS
	
	BEGIN TRY
		SET @ruta=(SELECT
						ruta
					FROM
						Parametro.Ruta
					WHERE
						id_ruta=@id_ruta);


	END TRY

	BEGIN CATCH
		SET @ruta='';
	END CATCH


GO
/****** Object:  StoredProcedure [Proceso].[SP_Busca_Numero_Importacion]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Proceso].[SP_Busca_Numero_Importacion]
	@numero_importacion nvarchar(50)
	,@resultado integer out
AS

	SET @resultado=(SELECT 
					count(1) 
				FROM 
					Proceso.Tablon_Impacto_Stock
				WHERE
					numero_importacion=@numero_importacion);
GO
/****** Object:  StoredProcedure [Proceso].[SP_Impactar_Tablon_Stock_001]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Proceso].[SP_Impactar_Tablon_Stock_001]
	@id_compra int

	,@numero_importacion nvarchar(50)
	
	,@id_lote int
	,@codigo_producto varchar(30)
	,@marca varchar(50)
	,@libre_circulacion nvarchar(255)
	,@fecha_certificado_libre_circulacion smalldatetime
	,@COA nvarchar(255)
	,@fecha_elaboracion smalldatetime
	,@fecha_vencimiento smalldatetime


AS



BEGIN TRAN
	BEGIN TRY
		
		INSERT INTO Proceso.Tablon_Impacto_Stock(id_compra
								
												,numero_importacion
												,id_lote
												,codigo_producto
												,marca
												,certificado_libre_circulacion
												,fecha_certificado_libre_circulacion
												,certificado_COA
												,fecha_elaboracion
												,fecha_vencimiento)
										VALUES(
												@id_compra
										
												,@numero_importacion
												,@id_lote
												,@codigo_producto
												,@marca
												,@libre_circulacion
												,CONVERT(date,@fecha_certificado_libre_circulacion,112)
												,@COA
												,CONVERT(date,@fecha_elaboracion,112)
												,CONVERT(date,@fecha_vencimiento,112));
		
		
		
		
		
					UPDATE 
						Proceso.Tablon_Impacto_Stock
					SET 
						id_ocompra_producto=ocp.id_ocompra_producto
					FROM 
						Proceso.Tablon_Impacto_Stock prtis 
						INNER JOIN Compra.Orden_Compra_Producto ocp ON ocp.codigo_producto= prtis.codigo_producto
					WHERE 
						ocp.id_orden_compra=@id_compra 
						AND prtis.id_ocompra_producto IS NULL;




		COMMIT;
	END TRY
	BEGIN CATCH
		
		
		ROLLBACK;
	END CATCH
GO
/****** Object:  StoredProcedure [Proceso].[SP_Impactar_Tablon_Stock_002]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Proceso].[SP_Impactar_Tablon_Stock_002]
	@numero_importacion nvarchar(50)
	,@id_lote int
	,@cantidad int
	,@posiciones_deposito int

AS



BEGIN TRAN
	BEGIN TRY
		UPDATE 
			Proceso.Tablon_Impacto_Stock 
		SET 
			cantidad=@cantidad
			,posiciones_deposito=@posiciones_deposito
		WHERE
			numero_importacion=@numero_importacion
			AND id_lote=@id_lote;


					

	

		COMMIT;
	END TRY
	BEGIN CATCH
		
		
		ROLLBACK;
	END CATCH
GO
/****** Object:  StoredProcedure [Proceso].[SP_Impactar_Tablon_Stock_003]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Proceso].[SP_Impactar_Tablon_Stock_003]
	@numero_importacion nvarchar(50)
	,@id_lote int
	,@id_deposito int
	,@id_stock int
	,@es_cuarentena int
	,@cantidad_posicion int
AS

DECLARE @id_tablon_stock int;
DECLARE @id_tablon_deposito int;

BEGIN TRAN
	BEGIN TRY
		SET @id_tablon_stock=(SELECT 
				id_tablon_impacto_stock
			FROM
				Proceso.Tablon_Impacto_Stock
			WHERE
				numero_importacion=@numero_importacion
				AND id_lote=@id_lote);



		INSERT INTO Proceso.Tablon_Impacto_Deposito(
			id_deposito
			,id_stock
			,es_cuarentena
			,cantidad_posicion)
		VALUES(
			@id_deposito
			,@id_stock
			,@es_cuarentena
			,@cantidad_posicion
			);
	
		SET @id_tablon_deposito=SCOPE_IDENTITY();

		INSERT INTO Proceso.Relacion_Tablones(
			id_tablon_impacto_stock
			,id_tablon_impacto_deposito)
		VALUES(
			@id_tablon_stock
			,@id_tablon_deposito
		);
			
		COMMIT;
	END TRY
	BEGIN CATCH
		
		
		ROLLBACK;
	END CATCH
GO
/****** Object:  StoredProcedure [Proceso].[SP_Impactar_Tablon_Stock_004]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Proceso].[SP_Impactar_Tablon_Stock_004]
	@numero_importacion nvarchar(50)
	,@id_orden_compra int


AS
	BEGIN TRANSACTION
		BEGIN TRY
			UPDATE 
				Compra.Orden_Compra 
			SET 
				codigo_importacion=@numero_importacion
			WHERE
				id_orden_compra=@id_orden_compra;
/*
			INSERT INTO Compra.lote(
				id_orden_compra
				,id_lote)	SELECT
								id_compra
								,id_lote
							FROM
								Proceso.Tablon_Impacto_Stock
							WHERE
								id_compra=@id_compra;
				
				

			INSERT INTO Relacion.Orden_Compra_Lote(
													

		*/

		END TRY
		BEGIN CATCH
			ROLLBACK;
		END CATCH
GO
/****** Object:  StoredProcedure [Proceso].[SP_Obtener_Producto_Sin_Asignar]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Proceso].[SP_Obtener_Producto_Sin_Asignar]
	@numero_importacion nvarchar(50)
	,@id_orden_compra int
	,@codigo_producto varchar(10)
	,@marca varchar(50)
	,@disponible int out
AS
DECLARE @asignado int;
DECLARE @comprado int;
BEGIN TRY
	SET @asignado=(SELECT 
						isnull(Sum(cantidad),0) 
					FROM
						Proceso.Tablon_Impacto_Stock
					WHERE
						numero_importacion=@numero_importacion
						AND codigo_producto=@codigo_producto
						AND marca=@marca);

	SET @comprado=(SELECT 
					OCP.cantidad 
				FROM 
					Compra.Orden_Compra_Producto OCP 
				WHERE	
					ocp.id_orden_compra=@id_orden_compra
					and ocp.codigo_producto=@codigo_producto
					and ocp.marca=@marca);
	
	SET @disponible=@comprado-@asignado;
	

END TRY
BEGIN CATCH
	SET @disponible=-1
END CATCH
GO
/****** Object:  StoredProcedure [Proceso].[SP_Orden_Compra_Tablon]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Proceso].[SP_Orden_Compra_Tablon]
	@id_orden_compra int
	,@numero_importacion nvarchar(50)
AS

	BEGIN TRY
		SELECT
			numero_importacion AS 'NUMERO IMPORTACION'
			,id_lote AS 'CODIGO DE LOTE'
			,codigo_producto AS 'CODIGO DE PRODUCTO'
			,marca AS 'MARCA'
			,isnull(cantidad,0) AS 'CANTIDAD ASIGNADA AL LOTE'
			,isnull(posiciones_deposito,0) AS 'POSICIONES ASIGNADAS AL LOTE'
		FROM
			Proceso.Tablon_Impacto_Stock
		WHERE
			id_compra=@id_orden_compra
			AND numero_importacion=@numero_importacion; 

	END TRY

	BEGIN CATCH
		print @@error;
	END CATCH
GO
/****** Object:  StoredProcedure [Produccion].[Consulta_Insumo_Stock]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[Consulta_Insumo_Stock]
	

AS


BEGIN TRY

	SELECT
		e.descripcion AS EMPAQUE
		,ce.capacidad AS CAPACIDAD
		,m.descripcion AS MEDIDA
		,si.cantidad- sum(convert(int,isnull(HPH.cantidad_insumo,0))) AS CANTIDAD
		,sum(convert(int,isnull(HPH.cantidad_insumo,0))) AS COMPROMETIDO
		,si.marca AS MARCA
	FROM
		Produccion.stock_insumo si
		INNER JOIN Produccion.Empaque e ON e.id_empaque=si.id_empaque
		INNER JOIN Produccion.Capacidad_Envase ce ON ce.id_capacidad_envase=si.id_capacidad
		INNER JOIN Produccion.Medida m ON m.id_medida=si.id_medida
		LEFT JOIN Produccion.Hoja_Fabricacion_Header HPH ON HPH.id_stock_insumo=si.id_stock_insumo
	GROUP BY
		e.descripcion
		,ce.capacidad
		,m.descripcion
		,si.cantidad 

		,si.marca 
	ORDER BY si.cantidad

END TRY
BEGIN CATCH
	print @@error;
END CATCH


GO
/****** Object:  StoredProcedure [Produccion].[Consulta_Producto_Cuarentena]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[Consulta_Producto_Cuarentena]
	
AS
	BEGIN TRY

		SELECT
			l.codigo_lote AS 'CODIGO DE LOTE'
			,ph.codigo_producto AS 'CODIGO DE PRODUCTO'
			,ph.nombre_producto AS 'NOMBRE DE PRODUCTO'
			,p.marca AS 'MARCA'
			,p.fecha_vencimiento AS 'FECHA DE VENCIMIENTO'
			,lp.cantidad AS 'EXISTENCIA EN STOCK'
			,isnull(phf.cantidad,0) AS 'COMPROMETIDO'
			,d.nombre AS 'DEPOSITO'
			,s.posicion AS 'POSICION EN DEPOSITO'
			,s.piso AS 'PISO EN DEPOSITO'
			,s.fila AS 'FILA EN DEPOSITO'
			,s.altura AS 'ALTURA EN DEPOSITO'
			,m.descripcion AS 'MEDIDA'
			,e.descripcion AS 'EMPAQUE'
			

		FROM 
			Produccion.Producto_Header ph
			INNER JOIN Produccion.Producto p ON p.codigo_producto=ph.codigo_producto
			INNER JOIN Relacion.Lote_Producto lp ON lp.id_producto=p.id_producto
			INNER JOIN Compra.Lote l ON l.id_batch=lp.id_batch
			INNER JOIN Produccion.Medida m ON m.id_medida=lp.id_medida
			INNER JOIN Produccion.Empaque e ON e.id_empaque=lp.id_empaque
			INNER JOIN Produccion.Capacidad_Envase ce ON ce.id_capacidad_envase=lp.id_capacidad_envase
			INNER JOIN Relacion.Lote_Stock ls ON ls.id_batch=lp.id_batch
			INNER JOIN Produccion.Stock s ON s.id_stock=ls.id_stock
			INNER JOIN Relacion.Deposito_Stock ds ON ds.id_stock=ls.id_stock
			INNER JOIN Sistema.Deposito d ON d.id_deposito=ds.id_deposito
			LEFT JOIN Proceso.Hoja_Fabricacion PHF ON phf.id_producto=p.id_producto
		WHERE
			lp.cuarentena=1
		ORDER BY
			p.fecha_vencimiento
		;

	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
GO
/****** Object:  StoredProcedure [Produccion].[Consulta_Producto_Stock]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[Consulta_Producto_Stock]
	@por_deposito bit
AS
	BEGIN TRY
		IF(@por_deposito=1)
			BEGIN
				SELECT
					d.nombre AS 'DEPOSITO'
					,ocp.codigo_producto AS 'CODIGO PRODUCTO'
					,ph.nombre_producto AS 'PRODUCTO'
					,sum(ls.cantidad)  AS 'EXISTENCIA EN STOCK'
					,sum(isnull(phf.cantidad,0)) AS 'COMPROMETIDO'
					,sum(ls.cantidad)-sum(isnull(phf.cantidad,0)) AS 'DISPONIBLE'
					,m.unidad as 'MEDIDA'
	
				FROM 
					Produccion.Stock s
					INNER JOIN RElacion.Deposito_Stock ds ON ds.id_stock=s.id_stock
					INNER JOIN Sistema.Deposito d ON d.id_deposito=ds.id_deposito
					INNER JOIN Relacion.Lote_stock ls ON ls.id_stock=s.id_stock
					INNER JOIN Relacion.Orden_compra_lote ocl ON ocl.id_lote=ls.id_batch
					INNER JOIN Compra.Orden_Compra_Producto ocp ON ocp.id_ocompra_producto=ocl.id_ocompra_producto
					INNER JOIN Produccion.Producto_Header ph ON ph.codigo_producto=ocp.codigo_producto
					INNER JOIN Relacion.oc_producto_empaque ope ON ope.id_ocompra_producto=ocp.id_ocompra_producto
					INNER JOIN Relacion.oc_producto_medida opm ON opm.id_ocompra_producto=ocp.id_ocompra_producto
					INNER JOIN Produccion.Medida m ON m.id_medida=opm.id_medida
					LEFT JOIN Proceso.Hoja_Fabricacion PHF ON phf.codigo_producto=ocp.codigo_producto
				GROUP BY
					ocp.codigo_producto	
					,ph.nombre_producto
					,m.unidad
					,d.nombre
				ORDER By
					ocp.codigo_producto
			END
		ELSE
			BEGIN
				SELECT
					ocp.codigo_producto AS 'CODIGO PRODUCTO'
					,ph.nombre_producto AS 'PRODUCTO'
					,sum(ls.cantidad)  AS 'EXISTENCIA EN STOCK'
					,sum(isnull(phf.cantidad,0)) AS 'COMPROMETIDO'
					,sum(ls.cantidad)-sum(isnull(phf.cantidad,0)) AS 'DISPONIBLE'
					,m.unidad as 'MEDIDA'
	
				FROM 
					Produccion.Stock s
					INNER JOIN Relacion.Lote_stock ls ON ls.id_stock=s.id_stock
					INNER JOIN Relacion.Orden_compra_lote ocl ON ocl.id_lote=ls.id_batch
					INNER JOIN Compra.Orden_Compra_Producto ocp ON ocp.id_ocompra_producto=ocl.id_ocompra_producto
					INNER JOIN Produccion.Producto_Header ph ON ph.codigo_producto=ocp.codigo_producto
					INNER JOIN Relacion.oc_producto_empaque ope ON ope.id_ocompra_producto=ocp.id_ocompra_producto
					INNER JOIN Relacion.oc_producto_medida opm ON opm.id_ocompra_producto=ocp.id_ocompra_producto
					INNER JOIN Produccion.Medida m ON m.id_medida=opm.id_medida
					LEFT JOIN Proceso.Hoja_Fabricacion PHF ON phf.codigo_producto=ocp.codigo_producto
				GROUP BY
					ocp.codigo_producto	
					,ph.nombre_producto
					,m.unidad

				ORDER By
					ocp.codigo_producto
			END
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH


	;


GO
/****** Object:  StoredProcedure [Produccion].[Consulta_Producto_Stock_Detalle]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[Consulta_Producto_Stock_Detalle]
	@codigo_producto varchar(10)
AS
	BEGIN TRY

				SELECT
			d.nombre AS 'NOMBRE DE PRODUCTO'
		--	,s.codigo_barra  AS 'IMAGEN DE IDENTIFICACION'
			,l.codigo_producto  AS 'CODIGO DE PRODUCTO'
			,ocp.marca AS 'MARCA'
			,l.fecha_elaboracion  AS 'FECHA DE ELABORACION'
			,l.fecha_vencimiento  AS 'FECHA DE VENCIMIENTO'
			,ls.cantidad AS 'EXISTENCIA EN POSICION'
			,isnull(phf.cantidad,0) AS 'COMPROMETIDO'
			,s.id_stock  AS 'IDENTIFICADOR STOCK'
			,d.id_deposito AS 'DEPOSITO'
			,s.piso AS 'PISO'
			,s.posicion AS 'POSICION'
			,s.altura AS 'ALTURA'
			,s.fila AS 'FILA'
			
		FROM 
			Compra.Lote l
			INNER JOIN Relacion.Orden_Compra_Lote ocl ON ocl.id_lote=l.id_batch
			INNER JOIN Compra.Orden_Compra_Producto ocp ON ocp.id_ocompra_producto=ocl.id_ocompra_producto
			INNER JOIN Relacion.Lote_Stock ls ON ls.id_batch=l.id_batch
			INNER JOIN Produccion.Stock s ON s.id_stock=ls.id_stock
			INNER JOIN Relacion.Deposito_Stock ds ON ds.id_stock=s.id_stock
			INNER JOIN Sistema.Deposito d ON d.id_deposito=ds.id_deposito
			LEFT JOIN Proceso.Hoja_Fabricacion PHF ON phf.codigo_producto=l.codigo_producto
		WHERE
			l.codigo_producto=@codigo_producto
			--AND lp.cuarentena=0
		ORDER BY
			l.fecha_vencimiento
		;

	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
GO
/****** Object:  StoredProcedure [Produccion].[Consulta_Producto_Stock_Fabricacion]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [Produccion].[Consulta_Producto_Stock_Fabricacion]
	@codigo_producto varchar(10)

AS
	BEGIN TRY

		SELECT
				d.nombre AS 'DEPOSITO'
				,ocp.codigo_producto AS 'CODIGO PRODUCTO'
				,ph.nombre_producto AS 'PRODUCTO'
				,sum(ls.cantidad)  AS 'EXISTENCIA EN STOCK'
				,sum(isnull(phf.cantidad,0)) AS 'COMPROMETIDO'
				,sum(ls.cantidad)-sum(isnull(phf.cantidad,0)) AS 'DISPONIBLE'
				,m.unidad as 'MEDIDA'
				,l.codigo_lote AS 'CODIGO DE LOTE'
				,IIF(s.cuarentena=1,'SI','NO') AS 'CUARENTENA'
				,Convert(varchar,l.fecha_vencimiento,111) AS 'FECHA DE VENCIMIENTO'
		FROM 
				Produccion.Stock s
				INNER JOIN RElacion.Deposito_Stock ds ON ds.id_stock=s.id_stock
				INNER JOIN Sistema.Deposito d ON d.id_deposito=ds.id_deposito
				INNER JOIN Relacion.Lote_stock ls ON ls.id_stock=s.id_stock
				INNER JOIN Compra.Lote l ON l.id_batch=ls.id_batch
				INNER JOIN Relacion.Orden_compra_lote ocl ON ocl.id_lote=ls.id_batch
				INNER JOIN Compra.Orden_Compra_Producto ocp ON ocp.id_ocompra_producto=ocl.id_ocompra_producto
				INNER JOIN Produccion.Producto_Header ph ON ph.codigo_producto=ocp.codigo_producto
				INNER JOIN Relacion.oc_producto_empaque ope ON ope.id_ocompra_producto=ocp.id_ocompra_producto
				INNER JOIN Relacion.oc_producto_medida opm ON opm.id_ocompra_producto=ocp.id_ocompra_producto
				INNER JOIN Produccion.Medida m ON m.id_medida=opm.id_medida
				LEFT JOIN Proceso.Hoja_Fabricacion PHF ON phf.codigo_producto=ocp.codigo_producto

		WHERE
			ocp.codigo_producto=@codigo_producto 
			
		GROUP BY
			ocp.codigo_producto	
			,ph.nombre_producto
			,m.unidad
			,d.nombre
			,s.cuarentena
			,l.codigo_lote 
			,l.fecha_vencimiento
			,ls.cantidad
	
		HAVING  (ls.cantidad-sum(convert(int,isnull(PHF.cantidad,0))))>0
	
		ORDER BY
			s.cuarentena DESC
			,l.fecha_vencimiento
		;

	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
GO
/****** Object:  StoredProcedure [Produccion].[Consulta_Producto_Stock_Fabricacion_Restante]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [Produccion].[Consulta_Producto_Stock_Fabricacion_Restante]
	@codigo_producto varchar(10)
	,@id_hoja_fabricacion int
	,@requerido int
	,@restante int out
AS
	BEGIN TRY
		DECLARE @comprometido INT;
		

		SET @comprometido=(

			SELECT
				sum(PHF.cantidad)
			
			FROM
				
				Proceso.Hoja_Fabricacion PHF
				INNER JOIN produccion.Producto p ON p.id_producto=phf.id_producto

			WHERE
				id_hoja_fabrica=@id_hoja_fabricacion
				and p.codigo_producto=@codigo_producto


			GROUP BY
				p.codigo_producto
				);

		SET @restante=@requerido-@comprometido;
				
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
GO
/****** Object:  StoredProcedure [Produccion].[Consulta_Producto_Stock_Lote]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[Consulta_Producto_Stock_Lote]
	@codigo_lote varchar(10)
AS
	BEGIN TRY

		SELECT
			p.codigo_producto AS 'CODIGO DE PRODUCTO'
			,p.nombre_producto AS 'NOMBRE DE PRODUCTO'
			,p.marca AS 'MARCA'
			,p.fecha_vencimiento AS 'FECHA DE VENCIMIENTO'
			,lp.cantidad AS 'EXISTENCIA EN STOCK'
			,d.nombre AS 'DEPOSITO'
			,s.posicion AS 'POSICION EN DEPOSITO'
			,s.piso AS 'PISO EN DEPOSITO'
			,s.fila AS 'FILA EN DEPOSITO'
			,s.altura AS 'ALTURA EN DEPOSITO'
			,m.descripcion AS 'MEDIDA'
			,e.descripcion AS 'EMPAQUE'
			

		FROM 
			Produccion.Producto p
			INNER JOIN Relacion.Lote_Stock lp ON lp.id_producto=p.id_producto
			INNER JOIN Compra.Lote l ON l.id_batch=lp.id_batch
			INNER JOIN Produccion.Medida m ON m.id_medida=lp.id_medida
			INNER JOIN Produccion.Empaque e ON e.id_empaque=lp.id_empaque
			INNER JOIN Produccion.Stock s ON s.id_stock=lp.id_stock
			INNER JOIN Relacion.Deposito_Stock ds ON ds.id_stock=lp.id_stock
			INNER JOIN Sistema.Deposito d ON d.id_deposito=ds.id_deposito

		WHERE
			l.codigo_lote=@codigo_lote

	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
GO
/****** Object:  StoredProcedure [Produccion].[SP_Agrega_Producto_HF]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Execute Compra.SP_Agrega_Producto_OC 1,1,1,1000,15000,1
select * from produccion.producto
select * from produccion.empaque
select * from produccion.medida


*/



CREATE  PROCEDURE [Produccion].[SP_Agrega_Producto_HF](
	@id_hoja_fabricacion INT
	,@cantidad INT
	,@codigo_producto VARCHAR(10)
	,@codigo_lote VARCHAR(10)
	,@cuarentena int
)
AS
BEGIN


	DECLARE @id_producto INT;
	
	SET @id_producto=(SELECT	
						LP.id_producto
					FROM
						Compra.Lote L
						INNER JOIN Relacion.Lote_Producto   LP ON LP.id_batch=L.id_batch
						INNER JOIN Produccion.Producto P ON P.id_producto=LP.id_producto
					WHERE
						L.codigo_lote=@codigo_lote
						AND P.codigo_producto=@codigo_producto
						AND lp.cuarentena=@cuarentena
						);

	
						


	BEGIN TRANSACTION
		BEGIN TRY
			
			INSERT INTO Proceso.Hoja_Fabricacion(
				id_hoja_fabrica
				,id_producto
				,cantidad
			
			)
			VALUES(
				@id_hoja_fabricacion
				,@id_producto
				,@cantidad
			)

				
		


			COMMIT;

		END TRY
		BEGIN CATCH
			print @@error;
			ROLLBACK;
		END CATCH
END
GO
/****** Object:  StoredProcedure [Produccion].[SP_Alta_Nuevo_Producto]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[SP_Alta_Nuevo_Producto]
	@codigo_producto VARCHAR(10)
	,@nombre_producto VARCHAR(30)
	,@marca VARCHAR(50)
	,@pais VARCHAR(60)
	,@MSDS nVARCHAR(255) NULL
	,@RNPA nVARCHAR(255) NULL
	,@CODIGO_ARANCELARIO nVarchar(12) NULL
	,@TASA float NULL
	,@error INT OUT
AS
BEGIN TRAN

	
	DECLARE @existe_codigo_marca INT;
	DECLARE @existe_codigo INT;
	DECLARE @existe_marca INT;
	DECLARE @id_pais INT;
	
	SET @error=0;
	SET @existe_codigo_marca=0;
	SET @existe_codigo=0;
	SET @existe_marca=0;
	SET @id_pais=0;


	BEGIN TRY
		SET @existe_codigo_marca=(SELECT 
						count(pm.marca)
					FROM
						Produccion.Producto_Marca pm
						INNER JOIN Produccion.Producto_Header ph ON ph.codigo_producto=pm.codigo_producto
					WHERE 
						pm.marca=@marca 
						AND ph.codigo_producto=@codigo_producto);
		
		
		IF(@existe_codigo_marca=0)
			BEGIN
				SET @existe_codigo=(SELECT 
										count(ph.codigo_producto)
									FROM
										Produccion.Producto_Header ph 
									WHERE 
										ph.codigo_producto=@codigo_producto);


				IF(@existe_codigo=0)
					BEGIN
						INSERT INTO Produccion.Producto_Header(
							codigo_producto
							,nombre_producto)
						VALUES(
							@codigo_producto
							,@nombre_producto
						);
					END


				SET @id_pais=(SELECT
									id_pais
								FROM
									Sistema.Pais
								WHERE
									nombre=@pais);
		


				INSERT INTO  Produccion.Producto_Marca(
					codigo_producto
					,marca
					,id_pais
					,MSDS
					,RNPA
				)
				VALUES(
					@codigo_producto
					,@marca
					,@id_pais
					,@MSDS
					,@RNPA
				);
			END

			IF(@CODIGO_ARANCELARIO is not null)
			BEGIN
				INSERT INTO Relacion.Derecho_importacion_Producto(id_concepto
																,codigo_producto
																,tasa
																,codigo_arancelario)
				VALUES(22
					,@codigo_producto
					,@tasa
					,@CODIGO_ARANCELARIO);

			END





		COMMIT;
	END TRY

	BEGIN CATCH
		SET @error=@@error;
		ROLLBACK;
	END CATCH
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Capacidad_Empaque]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [Produccion].[SP_Busca_Capacidad_Empaque]
	@empaque varchar(40)
 AS
	BEGIN TRY
		
			
			SELECT 
				CE.capacidad
			FROM
				Produccion.Capacidad_Envase CE
				INNER JOIN Produccion.Empaque E ON E.id_empaque=CE.id_empaque
			WHERE
				E.descripcion=@empaque;

	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Capacidad_Empaque_disponible]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [Produccion].[SP_Busca_Capacidad_Empaque_disponible]
	@empaque varchar(40)
 AS
	BEGIN TRY
		
			
			SELECT  DISTINCT
				CE.capacidad
			FROM
				Produccion.Capacidad_Envase CE
				INNER JOIN Produccion.Empaque E ON E.id_empaque=CE.id_empaque
				INNER JOIN Produccion.Stock_Insumo SI ON SI.id_capacidad=CE.id_capacidad_envase
			WHERE
				E.descripcion= @empaque;

	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Codigo_Arancelario]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[SP_Busca_Codigo_Arancelario]
		@codigo_producto VARCHAR(10)
		,@codigo_arancelario VARCHAR(12)=null OUT
		,@tasa float=0 OUT
AS
	--DECLARE @codigo_arancelario VARCHAR(12);
	BEGIN TRY 
		SET @codigo_arancelario=(
			SELECT 
				codigo_arancelario 
			FROM 
				relacion.Derecho_importacion_Producto
			WHERE
				codigo_producto=@codigo_producto);

			IF @codigo_arancelario is not null
			BEGIN
				SET @tasa=(
					SELECT 
						convert(varchar,tasa )
					FROM 
						relacion.Derecho_importacion_Producto
					WHERE
						codigo_arancelario=@codigo_arancelario);

			END
		--	print @tasa
		--	print @codigo_arancelario
	END TRY
	BEGIN CATCH
		print @@error
	END CATCH
	/*
DECLARE @ptasa varchar
DECLARE @pcodigo varchar

EXEC [Produccion].[SP_Busca_Codigo_Arancelario] '',@pcodigo,@ptasa
print @ptasa
print @pcodigo
*/
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Codigo_Producto]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
DECLARE @f1 date
DECLARE @f2 date
DECLARE @f3 date
DECLARE @f4 date

set @f1=CONVERT(date,getdate()-1000,112)
set @f2=CONVERT(date,getdate()-365,112)
set @f3=CONVERT(date,getdate()-30,112)
set @f4=CONVERT(date,getdate(),112)

Execute Produccion.SP_Busca_Producto null ,null,null,null,null,null,null
*/


CREATE  PROCEDURE [Produccion].[SP_Busca_Codigo_Producto]
AS

	BEGIN TRY

		
			SELECT 
				
				ph.codigo_producto AS 'CODIGO DEL PRODUCTO'
		
			FROM
				Produccion.Producto_Header ph
		
		
		

		

				
			

	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH


	
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Descripcion_Producto]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
DECLARE @r varchar(60)
execute [Produccion].[SP_Busca_Descripcion_Producto] 'FANGUL',@r
print @r
*/

CREATE  PROCEDURE [Produccion].[SP_Busca_Descripcion_Producto]
	@codigo_producto VARCHAR(10)
	,@descripcion_producto VARCHAR(30) OUT
AS

	BEGIN TRY

			SET @descripcion_producto=(
								SELECT 
				
									ISNULL(ph.nombre_producto,' ') AS 'NOMBRE DEL PRODUCTO'
		
								FROM
									Produccion.Producto_Header ph
		
		
								WHERE codigo_producto=@codigo_producto);

		

				
			

	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH


	
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Detalle_Cantidad_Ingrediente]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[SP_Busca_Detalle_Cantidad_Ingrediente]
	@codigo_ingrediente VARCHAR(10)
	,@codigo_producto VARCHAR(10)
	,@porcentaje INT OUT
AS
	BEGIN TRY
		SET @porcentaje=(
			SELECT 
				PR.Cantidad_Percentil AS 'PORCENTAJE EN RECETA'
			

			FROM
				Produccion.Receta R
				INNER JOIN Relacion.Producto_Receta PR ON PR.id_receta=R.id_receta
				INNER JOIN Produccion.Producto_header P ON P.codigo_producto=PR.codigo_ingrediente_producto

			WHERE
				R.codigo_producto=@codigo_producto
				AND PR.codigo_ingrediente_producto=@codigo_ingrediente);
	END TRY
	BEGIN CATCH
		print @@error;
	END CATCH

	--execute produccion.sp_busca_detalle_receta 'FAB042'
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Detalle_Receta]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[SP_Busca_Detalle_Receta]
	@codigo_producto VARCHAR(10)
AS
	BEGIN TRY
		SELECT
		--	R.nombre_receta
		--	pp.codigo_producto AS 'CODIGO INGREDIENTE'
			pr.codigo_ingrediente_producto AS 'NOMBRE INGREDIENTE'
			,pr.cantidad_percentil AS 'PORCENTAJE EN FORMULA'
	--		,convert(int,(SUM(isnull(lp.cantidad,0)))-convert(int,SUM(isnull(phf.cantidad,0)))) AS 'DISPONIBLE'
	--		,convert(int,SUM(isnull(phf.cantidad,0))) AS 'COMPROMETIDO'
	
	
		FROM
			produccion.receta R
			INNER JOIN relacion.Producto_Receta pr ON pr.id_receta=r.id_receta
	--		INNER JOIN produccion.producto pp ON pp.codigo_producto=pr.codigo_ingrediente_producto
	--		INNER JOIN Produccion.Producto_header P ON P.codigo_producto= pp.codigo_producto
	--		LEFT JOIN proceso.Hoja_Fabricacion PHF ON PHF.codigo_producto=PP.codigo_producto
	--		INNER JOIN relacion.Lote_Producto LP ON LP.id_producto=pp.id_producto
		WHERE
			R.codigo_producto=@codigo_producto

	--	GROUP BY
		--	pp.codigo_producto 
	--		r.nombre_receta
		--	,pr.cantidad_percentil
		--	,P.nombre_producto
	END TRY
	BEGIN CATCH
		print @@error;
	END CATCH

	--execute produccion.sp_busca_detalle_receta 'FAB042'
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Detalle_Receta_Fabricacion]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[SP_Busca_Detalle_Receta_Fabricacion]
	@codigo_producto VARCHAR(10)
AS
	BEGIN TRY
		SELECT
			R.nombre_receta AS 'RECETA'
			,pp.codigo_producto AS 'CODIGO INGREDIENTE'
			,pr.codigo_ingrediente_producto AS 'NOMBRE INGREDIENTE'
			,pr.cantidad_percentil AS 'PORCENTAJE EN FORMULA'
			,convert(int,(SUM(isnull(lp.cantidad,0)))-convert(int,SUM(isnull(phf.cantidad,0)))) AS 'DISPONIBLE'
			,convert(int,SUM(isnull(phf.cantidad,0))) AS 'COMPROMETIDO'
	
	
		FROM
			produccion.receta R
			INNER JOIN relacion.Producto_Receta pr ON pr.id_receta=r.id_receta
			INNER JOIN produccion.producto pp ON pp.codigo_producto=pr.codigo_ingrediente_producto
			INNER JOIN Produccion.Producto_header P ON P.codigo_producto= pp.codigo_producto
			LEFT JOIN proceso.Hoja_Fabricacion PHF ON PHF.codigo_producto=PP.codigo_producto
			INNER JOIN relacion.Lote_Producto LP ON LP.id_producto=pp.id_producto
		WHERE
			R.codigo_producto=@codigo_producto

		GROUP BY
			pp.codigo_producto 
			,pr.codigo_ingrediente_producto
			,r.nombre_receta
			,pr.cantidad_percentil
			,P.nombre_producto
	END TRY
	BEGIN CATCH
		print @@error;
	END CATCH

	--execute produccion.sp_busca_detalle_receta 'FAB042'
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Empaque]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE  PROCEDURE [Produccion].[SP_Busca_Empaque]

 AS
	BEGIN TRY
			
			SELECT 
				descripcion
			FROM
				Produccion.Empaque
	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
--execute Produccion.SP_busca_Empaque 
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Empaque_Disponible]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE  PROCEDURE [Produccion].[SP_Busca_Empaque_Disponible]

 AS
	BEGIN TRY
			
			SELECT DISTINCT
				e.descripcion
			FROM
				Produccion.Empaque e
				INNER JOIN Produccion.Stock_Insumo si ON si.id_empaque=e.id_empaque
				
	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
--execute Produccion.SP_busca_Empaque 
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Fecha_Inicial_Elaboracion]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE   PROCEDURE [Produccion].[SP_Busca_Fecha_Inicial_Elaboracion]
 AS
	BEGIN TRY

				SELECT 
					isnull(convert(varchar(12),min(fecha_elaboracion),111),getdate()) fecha
				FROM
					produccion.Producto

	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
/*
execute compra.SP_Busca_Fecha_Inicial_Compra 


*/
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Fecha_Inicial_Vencimiento]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE   PROCEDURE [Produccion].[SP_Busca_Fecha_Inicial_Vencimiento]
 AS
	BEGIN TRY

				SELECT 
					isnull(convert(varchar(12),min(fecha_vencimiento),111),getdate()) fecha
				FROM
					produccion.Producto

	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
/*
execute compra.SP_Busca_Fecha_Inicial_Compra 


*/
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Marca]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [Produccion].[SP_Busca_Marca]
AS

	BEGIN TRY

		
			SELECT 
				DISTINCT
				pm.marca AS 'MARCA'
		
			FROM
				Produccion.Producto_Marca pm
		
		
		

		

				
			

	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH


	
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Medida]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE  PROCEDURE [Produccion].[SP_Busca_Medida]

 AS
	BEGIN TRY
			
			SELECT 
				descripcion
			FROM
				Produccion.Medida
	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
--execute Produccion.SP_busca_Medida
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Producto]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
DECLARE @f1 date
DECLARE @f2 date
DECLARE @f3 date
DECLARE @f4 date

set @f1=CONVERT(date,getdate()-1000,112)
set @f2=CONVERT(date,getdate()-365,112)
set @f3=CONVERT(date,getdate()-30,112)
set @f4=CONVERT(date,getdate(),112)

Execute Produccion.SP_Busca_Producto null ,null,null,null,null,null,null
*/


CREATE  PROCEDURE [Produccion].[SP_Busca_Producto]
	@codigo_producto varchar(10) NULL
	,@descripcion_producto varchar(30) NULL
	,@marca_producto varchar(40) NULL
	,@fecha_inicio_elaboracion date NULL
	,@fecha_fin_elaboracion date NULL
	,@fecha_inicio_vencimiento date NULL
	,@fecha_fin_vencimiento date NULL

 AS

	DECLARE @primer_fecha_vencimiento date
	DECLARE @primer_fecha_elaboracion date


	BEGIN TRY

			SET @primer_fecha_vencimiento=CONVERT(date,(SELECT MIN(fecha_vencimiento) FROM Produccion.Producto),112);
			SET @primer_fecha_elaboracion=CONVERT(date,(SELECT MIN(fecha_elaboracion) FROM Produccion.Producto),112);

		
			SELECT 
				
				p.codigo_producto AS 'CODIGO DEL PRODUCTO'
				,p.nombre_producto AS 'NOMBRE DEL PRODUCTO'
				,p.marca AS 'MARCA DEL PRODUCTO'
				,CONVERT(date,p.fecha_elaboracion,112) AS 'FECHA DE ELABORACION'
				,CONVERT(date,p.fecha_vencimiento,112) AS 'FECHA DE VENCIMIENTO'
			FROM
				Produccion.Producto p
		
			WHERE p.nombre_producto LIKE('%' + IIF(@descripcion_producto is null,'', @descripcion_producto)+ '%')
				AND	p.codigo_producto LIKE('%'+	IIF(@codigo_producto is null,'', @codigo_producto) +'%')
				AND p.marca LIKE('%'+IIF(@marca_producto is null,'', @marca_producto) +'%')
				AND (CONVERT(date,p.fecha_vencimiento,112) BETWEEN CONVERT(date,IIF(@fecha_inicio_vencimiento is null,@primer_fecha_vencimiento,@fecha_inicio_vencimiento),112) 
														   AND	CONVERT(date,IIF(@fecha_fin_vencimiento is null,getdate(),@fecha_fin_vencimiento),112))
				AND (CONVERT(date,p.fecha_vencimiento,112) BETWEEN CONVERT(date,IIF(@fecha_inicio_elaboracion is null,@primer_fecha_elaboracion,@fecha_inicio_elaboracion),112) 
														   AND	CONVERT(date,IIF(@fecha_fin_elaboracion is null,getdate(),@fecha_fin_elaboracion),112))
			ORDER BY
				p.fecha_vencimiento;

		

				
			

	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH


	
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Producto_generico]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
DECLARE @f1 date
DECLARE @f2 date
DECLARE @f3 date
DECLARE @f4 date

set @f1=CONVERT(date,getdate()-1000,112)
set @f2=CONVERT(date,getdate()-365,112)
set @f3=CONVERT(date,getdate()-30,112)
set @f4=CONVERT(date,getdate(),112)

Execute Produccion.SP_Busca_Producto null ,null,null,null,null,null,null
*/


CREATE  PROCEDURE [Produccion].[SP_Busca_Producto_generico]
	@codigo_producto varchar(10) NULL
	,@descripcion_producto varchar(30) NULL
	,@rnpa bit

 AS
 	BEGIN TRY

		DECLARE @productos TABLE(
			codigo_producto VARCHAR(10)
			,nombre_producto VARCHAR(30)
			,marca VARCHAR(40)
			,MSDS NVARCHAR(255) NULL
			,RNPA NVARCHAR(255) NULL)
		
		INSERT INTO @productos(
			codigo_producto
			,nombre_producto
			,marca
			,MSDS
			,RNPA)

		SELECT 
			ph.codigo_producto
			,ph.nombre_producto
			,pm.marca
			,pm.MSDS
			,pm.RNPA
		FROM
			Produccion.Producto_header ph
			LEFT JOIN Produccion.Producto_Marca pm ON pm.codigo_producto=ph.codigo_producto
		
		WHERE ph.nombre_producto LIKE('%' + IIF(@descripcion_producto is null,'', @descripcion_producto)+ '%')
			AND	ph.codigo_producto LIKE('%'+	IIF(@codigo_producto is null,'', @codigo_producto) +'%')
			AND pm.marca is not null;

		IF(@rnpa=1) DELETE FROM @productos WHERE rnpa is null ;

		SELECT
			codigo_producto AS 'CODIGO DEL PRODUCTO'
			,nombre_producto AS 'NOMBRE DEL PRODUCTO'
			,marca AS 'MARCA'
			,msds AS 'MSDS'
			,RNPA AS 'RNPA'
		FROM
			@productos;
				
			

	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH


	
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Producto_header]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--execute produccion.sp_busca_producto_header  null,null,0

CREATE  PROCEDURE [Produccion].[SP_Busca_Producto_header]
	@codigo_producto varchar(10) NULL
	,@descripcion_producto varchar(30) NULL
	,@con_receta bit NULL

 AS
 	BEGIN TRY


		IF(@con_receta=1)
			BEGIN
				SELECT 
				
					ph.codigo_producto AS 'CODIGO DEL PRODUCTO'
					,ph.nombre_producto AS 'NOMBRE DEL PRODUCTO'
			
				FROM
					Produccion.Producto_header ph
					INNER JOIN Produccion.Receta r ON r.codigo_producto=ph.codigo_producto
		
				WHERE ph.nombre_producto LIKE('%' + IIF(@descripcion_producto is null,'', @descripcion_producto)+ '%')
					AND	ph.codigo_producto LIKE('%'+	IIF(@codigo_producto is null,'', @codigo_producto) +'%')
				


			END
		ELSE
			BEGIN
				SELECT 
				
					ph.codigo_producto AS 'CODIGO DEL PRODUCTO'
					,ph.nombre_producto AS 'NOMBRE DEL PRODUCTO'
			
				FROM
					Produccion.Producto_header ph

		
				WHERE ph.nombre_producto LIKE('%' + IIF(@descripcion_producto is null,'', @descripcion_producto)+ '%')
					AND	ph.codigo_producto LIKE('%'+	IIF(@codigo_producto is null,'', @codigo_producto) +'%')
				

			END
			

		

				
			

	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH


	
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Producto_Sistema_Header]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [Produccion].[SP_Busca_Producto_Sistema_Header]
	@codigo_producto varchar(10) NULL
	,@descripcion_producto varchar(30) NULL
	,@marca_producto varchar(30) NULL
	,@rnpa bit

 AS
 	BEGIN TRY

		DECLARE @productos TABLE(
			codigo_producto VARCHAR(10)
			,nombre_producto VARCHAR(30)
			,marca VARCHAR(40)
			,MSDS NVARCHAR(255) NULL
			,RNPA NVARCHAR(255) NULL)
		
		INSERT INTO @productos(
			codigo_producto
			,nombre_producto
			,marca
			,MSDS
			,RNPA)

		SELECT 
			ph.codigo_producto
			,ph.nombre_producto
			,pm.marca
			,pm.MSDS
			,pm.RNPA
		FROM
			Produccion.Producto_header ph
			LEFT JOIN Produccion.Producto_Marca pm ON pm.codigo_producto=ph.codigo_producto
		
		WHERE ph.nombre_producto LIKE('%' + IIF(@descripcion_producto is null,'', @descripcion_producto)+ '%')
			AND	ph.codigo_producto LIKE('%'+	IIF(@codigo_producto is null,'', @codigo_producto) +'%')
			AND pm.marca  LIKE('%'+	IIF(@marca_producto is null,'', @marca_producto) +'%');

		IF(@rnpa=1) DELETE FROM @productos WHERE rnpa is null ;

		SELECT
			codigo_producto AS 'CODIGO DEL PRODUCTO'
			,nombre_producto AS 'NOMBRE DEL PRODUCTO'
			,marca AS 'MARCA'
			,msds AS 'MSDS'
			,IIF(RNPA is null,'USO INTERNO',RNPA) AS 'RNPA'
		FROM
			@productos;
				
			

	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH


	
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Receta]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [Produccion].[SP_Busca_Receta]
	@codigo_producto varchar(10) 



 AS
 	BEGIN TRY


			DECLARE @id_receta int;
		

			SET @id_receta=(SELECT id_receta FROM Produccion.Receta WHERE codigo_producto=@codigo_producto);


			SELECT 
				
				codigo_producto
				,nombre_receta
				,id_receta
			FROM
				Produccion.Receta
				
			WHERE 
				id_receta =@id_receta;
				

		

				
			

	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH


	
--execute [Produccion].[SP_Busca_Receta] 'FAB042'
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Receta_Gestion]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [Produccion].[SP_Busca_Receta_Gestion]
	@codigo_producto varchar(10) null
	,@nombre_receta varchar(50) null
	,@codigo_ingrediente varchar(10) null


 AS
 	BEGIN TRY


			--DECLARE @id_receta int;
		

			--SET @id_receta=(SELECT id_receta FROM Produccion.Receta WHERE codigo_producto=@codigo_producto);


			SELECT DISTINCT 
				
				r.codigo_producto AS 'CODIGO A FABRICAR'
				,r.nombre_receta AS 'NOMBRE DE RECETA'
		--		,pr.codigo_ingrediente_producto as 'CODIGO INGREDIENTES'
		--		,(Select nombre_producto FROM Produccion.Producto_Header WHERE codigo_producto=pr.codigo_ingrediente_producto) AS 'INGREDIENTES'
			FROM
				Produccion.Receta R
				INNER JOIN Relacion.Producto_Receta PR ON PR.id_receta=r.id_receta
				
			WHERE 
				r.codigo_producto LIKE('%'+@codigo_producto+'%')
				AND r.nombre_receta LIKE('%'+@nombre_receta+'%')
				AND pr.codigo_ingrediente_producto LIKE('%'+@codigo_ingrediente+'%')
		
				

		

				
			

	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH


	
--execute [Produccion].[SP_Busca_Receta] 'FAB042'
GO
/****** Object:  StoredProcedure [Produccion].[SP_Crear_Hoja_Fabricacion]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from produccion.stock_insumo

CREATE PROCEDURE [Produccion].[SP_Crear_Hoja_Fabricacion]
	
	@id_receta INT
	,@empaque VARCHAR(40)
	,@capacidad INT
	,@medida VARCHAR(30)
	,@marca VARCHAR(50)
	,@cantidad_insumo int
	,@cantidad_fabricar int
	,@id_hoja_fabricacion int OUT


AS
	DECLARE @id_empaque INT;
	DECLARE @id_capacidad_envase INT;
	DECLARE @id_medida INT;
	DECLARE @id_stock_insumo INT;




	BEGIN TRANSACTION
		BEGIN TRY
			
			SET @id_empaque=(SELECT 
									id_empaque 
								FROM 
									Produccion.Empaque
								WHERE 
									descripcion=@empaque);
						

			SET @id_capacidad_envase=(SELECT 
											id_capacidad_envase 
										FROM 
											Produccion.Capacidad_Envase
										WHERE 
											id_empaque=@id_empaque
											AND capacidad=@capacidad);
								

			SET @id_medida=(SELECT	
								id_medida
							FROM
								Produccion.Medida
							WHERE 
								descripcion=@medida);
					
			SET @id_stock_insumo=(SELECT
										id_stock_insumo
									FROM
										Produccion.Stock_Insumo
									WHERE
										id_empaque=@id_empaque
										AND id_medida=@id_medida
										AND id_capacidad=@id_capacidad_envase
										AND marca=@marca);

			INSERT INTO 
				Produccion.Hoja_Fabricacion_Header(
					fecha_creacion_orden
					,id_receta
					,id_stock_insumo
					,cantidad_insumo
					,cantidad_fabricar)
			VALUES(
				getdate()
				,@id_receta
				,@id_stock_insumo
				,@cantidad_insumo
				,@cantidad_fabricar
			
			);
			
			SET @id_hoja_fabricacion=SCOPE_IDENTITY();

			INSERT INTO 
				Relacion.Hoja_Fab_Estado(
					id_hoja_fabrica
					,id_estado
					,fecha
					,vigente)
			VALUES(
				@id_hoja_fabricacion
				,0
				,getdate()
				,1);



					

				

/*AL CONFIRMAR
			UPDATE 
				Produccion.Stock_Insumo 
			SET 
				cantidad=cantidad-@cantidad 
			WHERE
				id_stock_insumo=@id_stock_insumo;
*/
			COMMIT;

		END TRY

		BEGIN CATCH
			print @@error;
			ROLLBACK;
		END CATCH






	
GO
/****** Object:  StoredProcedure [Produccion].[SP_Estado_Stock]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like
--execute produccion.SP_Estado_Stock 1
CREATE PROCEDURE  [Produccion].[SP_Estado_Stock]
	@estado bit=0 --0 disponibles 1 NO disponibles
AS
	BEGIN TRY
		IF(@estado=0)
			BEGIN
				SELECT 
					s.id_stock
					,s.piso
					,s.fila
					,s.altura
					,s.posicion
					,d.nombre
					,'DISPONIBLE' as status

				FROM
					Produccion.Stock s
					INNER JOIN Relacion.Deposito_Stock ds ON ds.id_stock=s.id_stock
					INNER JOIN Produccion.Deposito d ON d.id_deposito=ds.id_deposito
				WHERE
					s.id_stock	NOT IN (
										SELECT
											s.id_stock
										FROM 
											Produccion.Stock s
											INNER JOIN Relacion.Lote_Stock ls ON s.id_stock=ls.id_stock
											);
			END
		ELSE
			BEGIN
				SELECT 
					s.id_stock
					,s.piso
					,s.fila
					,s.altura
					,s.posicion
					,d.nombre
					,'OCUPADO' as status
				FROM
					Produccion.Stock s
					INNER JOIN Relacion.Deposito_Stock ds ON ds.id_stock=s.id_stock
					INNER JOIN Produccion.Deposito d ON d.id_deposito=ds.id_deposito
				WHERE
					s.id_stock	 IN (
										SELECT
											s.id_stock
										FROM 
											Produccion.Stock s
											INNER JOIN Relacion.Lote_Stock ls ON s.id_stock=ls.id_stock
											);

			END



	END TRY
	BEGIN CATCH
		print @@ERROR;
		

	END CATCH





GO
/****** Object:  StoredProcedure [Produccion].[SP_Impactar_Stock]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[SP_Impactar_Stock]
	@id_orden_compra int

AS

	DECLARE @id_certificado_circulacion INT;

	BEGIN TRAN

		BEGIN TRY
/*
		begin tran
		DECLARE @id_orden_compra INT
		set @id_orden_compra=1
*/
			DECLARE @LotesInsertados TABLE (
				id_batch INT
				
			)
			DECLARE @Posiciones_Stock TABLE(
				id_stock INT)
			
			
			INSERT INTO Compra.Lote(
				codigo_lote
				,codigo_producto
				,fecha_elaboracion
				,fecha_vencimiento)
			OUTPUT inserted.id_batch INTO @LotesInsertados
			SELECT
				numero_importacion+FORMAT(id_lote, '000')
				,codigo_producto
				,fecha_elaboracion
				,fecha_vencimiento
			FROM 
				Proceso.Tablon_Impacto_Stock
			WHERE
				id_compra=@id_orden_compra;


			INSERT INTO Relacion.Orden_Compra_Lote(
				id_lote
				,id_ocompra_producto)
			SELECT 
				li.id_batch 
				,ocp.id_ocompra_producto
			FROM  
				@LotesInsertados li
				INNER JOIN Compra.Lote l on l.id_batch=li.id_batch
				INNER JOIN Compra.Orden_Compra_Producto ocp ON ocp.codigo_producto=l.codigo_producto
			WHERE
				ocp.id_orden_compra=@id_orden_compra;

			
			INSERT INTO Compra.Certificado_COA(
				certificado_coa
				,fecha_certificado_coa
				,id_ocompra_producto
			)
			SELECT DISTINCT 
				prtis.certificado_coa
				,getdate()
				,ocp.id_ocompra_producto
			FROM compra.Orden_Compra_Producto ocp
			INNER JOIN proceso.tablon_impacto_stock prtis ON prtis.codigo_producto=ocp.codigo_producto
			WHERE ocp.id_orden_compra=@id_orden_compra;



			INSERT INTO relacion.Lote_stock(
				
				id_batch
				,id_stock
				,fecha_impacto
				,cantidad
			)
			OUTPUT inserted.id_stock INTO @Posiciones_Stock
			SELECT
				l.id_batch
				,prtid.id_stock
				,getdate()
				,prtid.cantidad_posicion

			FROM
				Proceso.Tablon_Impacto_Stock prtis
				INNER JOIN Proceso.Relacion_Tablones prrt ON prrt.id_tablon_impacto_stock=prtis.id_tablon_impacto_stock
				INNER JOIN Proceso.Tablon_Impacto_Deposito prtid ON prtid.id_tablon_impacto_deposito=prrt.id_tablon_impacto_deposito
				INNER JOIN Compra.Lote l ON l.codigo_lote=prtis.numero_importacion+FORMAT(prtis.id_lote, '000')
			WHERE 
				prtis.id_compra=@id_orden_compra

		
			UPDATE Produccion.Stock
			SET disponible=0
			WHERE id_stock IN(SELECT id_Stock FROM @Posiciones_Stock);
			COMMIT;			
		
			DELETE FROM Proceso.Tablon_Impacto_Deposito
			WHERE id_tablon_impacto_deposito IN(SELECT id_tablon_impacto_deposito
												FROM Proceso.Relacion_Tablones
												WHERE id_tablon_impacto_stock IN(SELECT id_tablon_impacto_stock
																				 FROM Proceso.Tablon_Impacto_Stock
																				 WHERE id_compra=@id_orden_compra));

			DELETE FROM Proceso.Relacion_Tablones
			WHERE id_tablon_impacto_stock IN (SELECT id_tablon_impacto_stock
											  FROM Proceso.Tablon_Impacto_Stock
											 WHERE id_compra=@id_orden_compra);

			DELETE FROM Proceso.Tablon_Impacto_Stock WHERE id_compra=@id_orden_compra;
		
		END TRY
		BEGIN CATCH

			print @@error;
			ROLLBACK;
		END CATCH
GO
/****** Object:  StoredProcedure [Produccion].[SP_Impactar_Stock_Cuarentena]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*


DECLARE @fecha1 date
DECLARE @fecha2 date

SET @fecha1=getdate()
SET @fecha2=getdate()
Execute Produccion.SP_Impactar_Stock_Paso_Tres 5,19,11,'PRC001',@fecha1,@fecha2,0


(1 row affected)

(0 rows affected)

(1 row affected)

Completion time: 2023-01-25T16:38:21.9115405-03:00
*/




CREATE PROCEDURE [Produccion].[SP_Impactar_Stock_Cuarentena]
	@codigo_lote varchar(10)
	,@id_stock	int

AS
	DECLARE @id_lote_producto int;
	DECLARE @id_batch int;

	BEGIN TRAN

		BEGIN TRY

			SET @id_lote_producto=(SELECT 
										LP.id_lote_producto
									FROM
										Relacion.Lote_Producto LP
										INNER JOIN Compra.Lote  L ON L.id_batch=LP.id_batch
									WHERE 
										L.codigo_lote=@codigo_lote
										AND LP.cuarentena=1);

			SET @id_batch=(SELECT 
										lp.id_batch
									FROM
										Relacion.Lote_Producto LP
										
									WHERE 
										lp.id_lote_producto=@id_lote_producto);


			INSERT INTO Relacion.Stock_Cuarentena(
				id_lote_producto
				,id_stock
				,id_batch
				,fecha_impacto
		
			)VALUES
			(
				@id_lote_producto
				,@id_stock
				,@id_batch
				,getdate()
		
			);

	

			UPDATE Produccion.stock SET disponible=0 WHERE id_stock=@id_stock;
			
			
			COMMIT;

	END TRY
	BEGIN CATCH

			print @@error;
			ROLLBACK;
	END CATCH

GO
/****** Object:  StoredProcedure [Produccion].[SP_Impactar_Stock_Paso_Dos]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*


DECLARE @fecha1 date
DECLARE @fecha2 date

SET @fecha1=getdate()
SET @fecha2=getdate()
Execute Produccion.SP_Impactar_Stock_Paso_Tres 5,19,11,'PRC001',@fecha1,@fecha2,0


(1 row affected)

(0 rows affected)

(1 row affected)

Completion time: 2023-01-25T16:38:21.9115405-03:00
*/




CREATE PROCEDURE [Produccion].[SP_Impactar_Stock_Paso_Dos]
	@id_lote int
	,@codigo_producto varchar(10)
	,@fecha_elaboracion date
	,@fecha_vencimiento date
	,@marca varchar(40)
	,@cantidad int
	,@id_medida int
	,@id_empaque int
	,@id_capacidad int
	,@cuarentena int
AS

	DECLARE @id_producto int
BEGIN TRAN

		BEGIN TRY
			
			INSERT INTO Produccion.Producto(
				codigo_producto
				,fecha_elaboracion
				,fecha_vencimiento
				,marca
				
			)VALUES
			(
				@codigo_producto
				,@fecha_elaboracion
				,@fecha_vencimiento
				,@marca
			);

			SET @id_producto=SCOPE_IDENTITY();

			INSERT INTO Relacion.Lote_Producto(
				id_batch
				,id_producto
				,cantidad
				,id_medida
				,id_empaque
				,id_capacidad_envase
				,cuarentena

			)VALUES
			(
				@id_lote
				,@id_producto
				,@cantidad
				,@id_medida
				,@id_empaque
				,@id_capacidad
				,@cuarentena
			);
			


			
			COMMIT;

		END TRY
		BEGIN CATCH
			SET @id_lote=0;
			print @@error;
			ROLLBACK;
		END CATCH

			


GO
/****** Object:  StoredProcedure [Produccion].[SP_Impactar_Stock_Paso_Tres]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*


DECLARE @fecha1 date
DECLARE @fecha2 date

SET @fecha1=getdate()
SET @fecha2=getdate()
Execute Produccion.SP_Impactar_Stock_Paso_Tres 5,19,11,'PRC001',@fecha1,@fecha2,0


(1 row affected)

(0 rows affected)

(1 row affected)

Completion time: 2023-01-25T16:38:21.9115405-03:00
*/




CREATE PROCEDURE [Produccion].[SP_Impactar_Stock_Paso_Tres]
	@id_lote int
	,@id_stock	int

AS
	BEGIN TRAN

		BEGIN TRY



			INSERT INTO Relacion.Lote_Stock(
				id_batch
				,id_stock
				,fecha_impacto
		
			)VALUES
			(
				@id_lote
				,@id_stock
				,getdate()
		
			);

			UPDATE Produccion.stock SET disponible=0 WHERE id_stock=@id_stock;
			
			
			COMMIT;

	END TRY
	BEGIN CATCH

			print @@error;
			ROLLBACK;
	END CATCH

GO
/****** Object:  StoredProcedure [Produccion].[SP_Ingresar_Producto]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [Produccion].[SP_Ingresar_Producto]
	@codigo_producto varchar(10)
	,@nombre_producto varchar(30)
	,@fecha_elaboracion smalldatetime
	,@dias_al_vencimiento int
	,@error int=0 OUT

	
	

 AS
	BEGIN TRANSACTION
		BEGIN TRY
		
			INSERT INTO Produccion.Producto(
				codigo_producto
				,nombre_producto
				,fecha_elaboracion
				,fecha_vencimiento
			)VALUES(
				@codigo_producto
				,@nombre_producto
				,@fecha_elaboracion
				,@fecha_elaboracion+@dias_al_vencimiento)

			COMMIT
			SET @error=0
	END TRY
	BEGIN CATCH
		SET @error= @@ERROR;
		ROLLBACK

	END CATCH
--execute Produccion.SP_Selector_batch 1


--select * from Produccion.Producto
--delete from produccion.producto where codigo_producto='PRC001'
GO
/****** Object:  StoredProcedure [Produccion].[SP_Obtener_Id_Producto]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
DECLARE @f1 date
DECLARE @f2 date
DECLARE @f3 date
DECLARE @f4 date

set @f1=CONVERT(date,getdate()-1000,112)
set @f2=CONVERT(date,getdate()-365,112)
set @f3=CONVERT(date,getdate()-30,112)
set @f4=CONVERT(date,getdate(),112)

Execute Produccion.SP_Busca_Producto null ,null,null,null,null,null,null
*/


CREATE  PROCEDURE [Produccion].[SP_Obtener_Id_Producto]
	@codigo_producto varchar(10) NULL
	,@marca_producto varchar(40) NULL
	,@id_producto int OUT


 AS



	BEGIN TRY
		SET @id_producto=(SELECT 
							codigo_producto
						  FROM
							Produccion.Producto_header
						  WHERE
							codigo_producto=@codigo_producto
							--AND marca=@marca_producto
						  );

		

				
			

	
	END TRY
	BEGIN CATCH
		SET @id_producto=0;


	END CATCH


	
GO
/****** Object:  StoredProcedure [Produccion].[SP_Selector_Batch]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [Produccion].[SP_Selector_Batch]
	@id_producto int NULL

	
	

 AS

		BEGIN TRY
	
			SELECT 
				l.codigo_lote AS 'CODIGO BATCH'
				,l.fecha_certificado_analisis AS 'FECHA CERTIFICADO ANALISIS'
				,l.fecha_certificado_circulacion AS 'FECHA CERTIFICADO CIRCULACION'
				,i.codigo_material AS 'CODIGO DE MATERIAL'
				,i.materia_prima AS 'MATERIA PRIMA'
				,e.descripcion AS 'EMPAQUE'
				,rlm.cantidad AS 'CANTIDAD'
				,m.unidad as 'UNIDAD DE MEDIDA'

			FROM
				Produccion.Lote l
				INNER JOIN Relacion.Lote_Ingrediente li ON l.id_batch=li.id_batch
				INNER JOIN Produccion.Ingrediente i ON i.id_ingrediente=li.id_ingrediente
				INNER JOIN Relacion.Lote_Producto lp ON lp.id_batch=l.id_batch
				INNER JOIN Produccion.Producto p ON lp.id_producto=p.id_producto
				INNER JOIN Relacion.Lote_Empaque rle ON l.id_batch=rle.id_batch
				INNER JOIN Produccion.Empaque e ON rle.id_empaque=e.id_empaque
				INNER JOIN Relacion.Lote_Medida rlm ON l.id_batch=rlm.id_batch
				INNER JOIN Produccion.Medida m ON rlm.id_medida=m.id_medida
			WHERE
				p.id_producto=@id_producto
					

	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
--execute Produccion.SP_Selector_batch 1
--select * from produccion.lote
GO
/****** Object:  StoredProcedure [Produccion].[SP_Stock]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[SP_Stock]
	@id_producto int
	,@nombre_producto varchar(30) NULL
	,@stock_total bit=1
AS
	
	BEGIN TRY
	
	IF(@stock_total=1)
		BEGIN
		IF(not @id_producto is null)
			BEGIN
	
				SELECT 
					p.codigo_producto
					,p.nombre_producto
					,SUM(ls.cantidad)
					,m.descripcion

				FROM
					produccion.producto p
					INNER JOIN relacion.Lote_Producto lp ON lp.id_producto=p.id_producto
					INNER JOIN compra.lote cl ON cl.id_batch=lp.id_batch
					INNER JOIN relacion.Lote_Empaque le ON le.id_batch=cl.id_batch
					INNER JOIN Produccion.Empaque e ON e.id_empaque=le.id_empaque
					INNER JOIN relacion.Lote_Medida lm ON lm.id_lote=cl.id_batch
					INNER JOIN Produccion.Medida m ON m.id_medida=lm.id_medida
					INNER JOIN relacion.lote_stock ls ON ls.id_batch=cl.id_batch
				
				WHERE p.id_producto =@id_producto
				
				GROUP BY
					p.codigo_producto
					,p.nombre_producto
					,m.descripcion
				
				;
			END
	
		ELSE
		
			BEGIN
	
					SELECT 
						p.codigo_producto
						,p.nombre_producto
						,SUM(ls.cantidad)
						,m.descripcion

					FROM
						produccion.producto p
						INNER JOIN relacion.Lote_Producto lp ON lp.id_producto=p.id_producto
						INNER JOIN compra.lote cl ON cl.id_batch=lp.id_batch
						INNER JOIN relacion.Lote_Empaque le ON le.id_batch=cl.id_batch
						INNER JOIN Produccion.Empaque e ON e.id_empaque=le.id_empaque
						INNER JOIN relacion.Lote_Medida lm ON lm.id_lote=cl.id_batch
						INNER JOIN Produccion.Medida m ON m.id_medida=lm.id_medida
						INNER JOIN relacion.lote_stock ls ON ls.id_batch=cl.id_batch
				
					WHERE	p.nombre_producto LIKE('%' + @nombre_producto + '%')
				
					GROUP BY
						p.codigo_producto
						,p.nombre_producto
						,m.descripcion
				
					;
	
				
				END
		END
	ELSE
		BEGIN
			SELECT 
				p.codigo_producto
				,p.nombre_producto
				,SUM(ls.cantidad)
				,m.descripcion
				,cl.codigo_lote
				,s.piso
				,s.altura
				,s.fila
				,s.posicion

			FROM
				produccion.producto p
				INNER JOIN relacion.Lote_Producto lp ON lp.id_producto=p.id_producto
				INNER JOIN compra.lote cl ON cl.id_batch=lp.id_batch
				INNER JOIN relacion.Lote_Empaque le ON le.id_batch=cl.id_batch
				INNER JOIN Produccion.Empaque e ON e.id_empaque=le.id_empaque
				INNER JOIN relacion.Lote_Medida lm ON lm.id_lote=cl.id_batch
				INNER JOIN Produccion.Medida m ON m.id_medida=lm.id_medida
				INNER JOIN relacion.lote_stock ls ON ls.id_batch=cl.id_batch
				INNER JOIN produccion.Stock s ON s.id_stock=ls.id_stock
			WHERE p.id_producto =@id_producto
				
			GROUP BY
				p.codigo_producto
				,p.nombre_producto
				,m.descripcion
				,cl.codigo_lote
				,s.piso
				,s.altura
				,s.fila
				,s.posicion
		END

	END TRY
	BEGIN CATCH
		print @@ERROR;
		print ERROR_MESSAGE();

	END CATCH

GO
/****** Object:  StoredProcedure [Produccion].[SP_Verifica_Stock_Insumo]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
DECLARE @R int;
Produccion.SP_Verifica_Stock_Insumo 'BOLSA PAPEL BLANCA',25,'KILOGRAMOS',1000,@R;
print @R;
*/
CREATE PROCEDURE [Produccion].[SP_Verifica_Stock_Insumo]
	@descripcion varchar(40)
	,@capacidad int
	,@medida varchar(30)
	,@requerido int
	,@disponible int OUT
AS


BEGIN TRY

	DECLARE @id_empaque int;

	DECLARE @id_medida int;

	SET @id_empaque=(SELECT id_empaque FROM Produccion.Empaque WHERE descripcion=@descripcion);

	SET @id_medida=(SELECT id_medida FROM Produccion.Medida WHERE descripcion=@medida);

	SET @disponible=(
					SELECT
						SUM(si.cantidad)-@requerido
					FROM
						Produccion.stock_insumo si
						INNER JOIN Produccion.Empaque e ON e.id_empaque=si.id_empaque
						INNER JOIN Produccion.Capacidad_Envase ce ON ce.id_capacidad_envase=si.id_capacidad
						INNER JOIN Produccion.Medida m ON m.id_medida=si.id_medida
					WHERE
						e.id_empaque=@id_empaque AND m.id_medida=@id_medida and ce.capacidad=@capacidad
					GROUP BY e.descripcion,ce.capacidad, m.descripcion 
						
					);

	

END TRY
BEGIN CATCH
	print @@error;
END CATCH


GO
/****** Object:  StoredProcedure [Sistema].[SP_busca_acceso]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Sistema].[SP_busca_acceso]
	@usuario varchar(20) 
	
AS
	
	BEGIN TRY
		SELECT
			r.id_perfil
			,r.id_acceso
		FROM
			Relacion.Usuario_Perfil_Acceso r
			INNER JOIN Sistema.Usuario u ON r.id_usuario=u.id_usuario
		WHERE
			u.usuario=@usuario;

	END TRY
		BEGIN CATCH
		print @@ERROR;


	END CATCH
GO
/****** Object:  StoredProcedure [Sistema].[SP_Busca_Deposito]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE PROCEDURE [Sistema].[SP_Busca_Deposito]

 AS
	BEGIN TRY
			
		SELECT
				d.nombre
				,v.CIUDAD
				,d.id_deposito
		FROM 
			sistema.deposito d 
			INNER JOIN Relacion.Deposito_ciudad c ON c.id_deposito=d.id_deposito
			INNER JOIN Sistema.vw_ciudades v ON v.ID_CIUDAD=c.id_ciudad

	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
--execute Compra.[SP_Busca_Flete]
GO
/****** Object:  StoredProcedure [Sistema].[SP_Busca_Envio]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE  PROCEDURE [Sistema].[SP_Busca_Envio]

 AS
	BEGIN TRY
			
			SELECT 
				descripcion
			FROM
				 Sistema.Envio
	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
--execute Compra.[SP_Busca_Flete]
GO
/****** Object:  StoredProcedure [Sistema].[SP_Busca_Estados]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE  PROCEDURE [Sistema].[SP_Busca_Estados](

	@id_estado int NULL
)

 AS
	DECLARE @estados TABLE(
		id_estado INT
		,descripcion VARCHAR(20)
	);

	BEGIN TRY

			INSERT INTO @estados(
				id_estado
				,descripcion
			)
			SELECT 
				id_estado
				,descripcion
			FROM
				Sistema.Estado;
	

			IF(not @id_estado is null)
			BEGIN
				DELETE FROM @estados WHERE id_estado=@id_estado;
			
			END

			SELECT 
				descripcion
			FROM
				@estados
			
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
--execute Sistema.SP_Busca_Medio_Pago
GO
/****** Object:  StoredProcedure [Sistema].[SP_Busca_ID_Ciudad]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [Sistema].[SP_Busca_ID_Ciudad]
	@continente varchar(40)
	,@pais varchar(60)
	,@estado varchar(20)
	,@ciudad varchar(20)
	,@id_ciudad int OUT
AS
	BEGIN TRY
		SET @id_ciudad=(	
			SELECT
				ID_CIUDAD
			FROM 
				Sistema.vw_ciudades
			WHERE
				CONTINENTE =@continente
				AND PAIS =@pais
				AND ESTADO =@estado
				AND CIUDAD =@ciudad);


	END TRY
	BEGIN CATCH
		SET @id_ciudad=0;		

	END CATCH
GO
/****** Object:  StoredProcedure [Sistema].[SP_Busca_ID_Estado]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Sistema].[SP_Busca_ID_Estado](
	@descripcion varchar(20)

	)

AS

					SELECT
						id_estado
					FROM
						Sistema.Estado
					WHERE
						descripcion=TRIM(@descripcion)
GO
/****** Object:  StoredProcedure [Sistema].[SP_Busca_ID_Proveedor]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [Sistema].[SP_Busca_ID_Proveedor]
	@razon_social varchar(70)
	,@domicilio varchar(40)
	,@telefono varchar(20)
	,@fax varchar(20)
	,@mail varchar(40)
	,@id_proveedor int OUT
AS
	BEGIN TRY
		SET @id_proveedor=(	
			SELECT
				id_proveedor
			FROM 
				Compra.Proveedor
			WHERE
				razon_social=razon_social
				AND domicilio=@domicilio
				AND telefono=@telefono
				AND fax=@fax
				AND mail=@mail);


	END TRY
	BEGIN CATCH
		SET @id_proveedor=0;		

	END CATCH
GO
/****** Object:  StoredProcedure [Sistema].[SP_Busca_Medio_Pago]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE  PROCEDURE [Sistema].[SP_Busca_Medio_Pago]

 AS
	BEGIN TRY
			
			SELECT 
				descripcion
			FROM
				Sistema.Medio_pago
	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
--execute Sistema.SP_Busca_Medio_Pago
GO
/****** Object:  StoredProcedure [Sistema].[SP_Busca_Moneda]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE  PROCEDURE [Sistema].[SP_Busca_Moneda]

 AS
	BEGIN TRY
			
			SELECT 
				nomenclatura
				,descripcion
			FROM
				Sistema.moneda
	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
--execute Produccion.SP_busca_moneda
GO
/****** Object:  StoredProcedure [Sistema].[SP_Busca_Pais]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [Sistema].[SP_Busca_Pais]
AS

	DECLARE @Lista_Paises TABLE (nombre VARCHAR(60),cantidad INT);
	BEGIN TRY

			INSERT INTO 
				@Lista_Paises(
					nombre
					,cantidad)
			SELECT 
				p.nombre
				,count(pm.marca)
			FROM
				Sistema.Pais p
				LEFT JOIN Produccion.Producto_Marca pm ON pm.id_pais=p.id_pais
		
			GROUP BY p.nombre;
	

		

			SELECT
				nombre
			FROM 
				@Lista_Paises
			
			ORDER BY cantidad DESC;
	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH


	
--execute Sistema.[SP_Busca_Pais]
GO
/****** Object:  StoredProcedure [Sistema].[SP_Busca_Posiciones_Deposito]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [Sistema].[SP_Busca_Posiciones_Deposito]
	@id_deposito int
	,@es_cuarentena int
 AS
	BEGIN TRY
			

		SELECT
			s.id_stock AS 'IDENTIFICACION'
			,s.piso AS 'PISO'
			,s.posicion AS 'POSICION'
			,s.altura AS 'ALTURA'
			,s.fila AS 'FILA'
		FROM
			produccion.stock s
			INNER JOIN relacion.Deposito_Stock ds ON ds.id_stock=s.id_stock
			INNER JOIN sistema.deposito d ON d.id_deposito = ds.id_deposito

		WHERE
			s.disponible=1
			AND d.id_deposito=@id_deposito
			AND s.cuarentena=@es_cuarentena
			AND s.id_stock NOT IN(Select id_stock FROM Proceso.Tablon_Impacto_Deposito);
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
GO
/****** Object:  StoredProcedure [Sistema].[SP_busca_usuario]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Sistema].[SP_busca_usuario]
	@usuario varchar(20) 
	,@password varchar(20)
	,@resultado bit OUT
	
AS
	
	BEGIN TRY
	
		SET @resultado=(
			SELECT
				count(u.usuario)
	
		
			FROM
				Sistema.Usuario u
				INNER JOIN Relacion.Usuario_Pass rup ON u.id_usuario=rup.id_usuario
				INNER JOIN Sistema.Pass p ON rup.id_pass=p.id_pass
			WHERE
				(p.clave=@password 
				AND p.vigente=1)
				AND u.usuario=@usuario
		);

	END TRY
	BEGIN CATCH
		print @@ERROR;
		ROLLBACK;

	END CATCH



--execute Sistema.SP_busca_usuario 'plinares','123456'
/*
select * from Sistema.Usuario
select * from Relacion.usuario_pass

select * from Sistema.Pass
*/
GO
/****** Object:  StoredProcedure [Sistema].[SP_Buscar_Locacion]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE PROCEDURE  [Sistema].[SP_Buscar_Locacion]
	@continente varchar(40)
	,@pais varchar(60)
	,@estado varchar(20)
	,@ciudad varchar(20)
AS
	BEGIN TRY
			
		SELECT
			CONTINENTE
			,PAIS
			,ESTADO
			,CIUDAD

		FROM 
			Sistema.vw_ciudades
		WHERE
			CONTINENTE like('%'+@continente+'%')
			AND PAIS like('%'+@pais+'%')
			AND ESTADO like('%'+@estado+'%')
			AND CIUDAD like('%'+@ciudad+'%')


	END TRY
	BEGIN CATCH
		print @@ERROR;
		

	END CATCH






--execute Sistema.SP_buscar_locacion 'sud','b','',''
--select * from produccion.producto

GO
/****** Object:  StoredProcedure [Sistema].[SP_Carga_Grilla_Deposito]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Sistema].[SP_Carga_Grilla_Deposito]


AS

BEGIN TRY
		
		SELECT
			nombre
			,domicilio
			,telefono
			,fax
			,mail
			,CIUDAD
			,estado
	
		FROM 
			Sistema.VW_Depositos 


END TRY

BEGIN CATCH
		print @@ERROR;
END CATCH




GO
/****** Object:  StoredProcedure [Venta].[SP_Busca_Cliente]    Script Date: 28/8/2023 11:09:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--incluir marca producto en el like

CREATE  PROCEDURE [Venta].[SP_Busca_Cliente]
	@razon_social varchar(30) NULL
	,@ciudad varchar(20) NULL
	,@estado varchar(20) NULL
	,@pais varchar(60) NULL
 AS

	

	BEGIN TRY


		
			SELECT 
				v.razon_social AS 'RAZON SOCIAL'
				,v.domicilio AS 'DOMICILIO'
				,p.prefijo_telefonico+v.telefono AS 'TELEFONO'
				,v.mail AS 'CORREO ELECTRONICO'
				,c.nombre AS 'CIUDAD'
				,dp.nombre AS 'ESTADO-PROVINCIA'
				,p.nombre AS 'PAIS'
				
			FROM
				Venta.cliente v
				INNER JOIN Relacion.Cliente_Ciudad rcc ON rcc.id_cliente=v.id_cliente
				INNER JOIN Sistema.Ciudad c ON c.id_ciudad=rcc.id_ciudad
				INNER JOIN Relacion.DP_Ciudad rdpc ON rdpc.id_ciudad=c.id_ciudad
				INNER JOIN Sistema.Division_Politica dp ON dp.id_division_politica=rdpc.id_division_politica
				INNER JOIN Relacion.Pais_DP rpdp ON rpdp.id_division_politica=dp.id_division_politica
				INNER JOIN Sistema.Pais p ON p.id_pais=rpdp.id_pais
				INNER JOIN Relacion.Pais_Continente rpc ON rpc.id_pais=p.id_pais
				INNER JOIN Sistema.Continente cc ON cc.id_continente=rpc.id_continente
		
			WHERE v.razon_social LIKE('%' + @razon_social + '%')
				AND c.nombre LIKE('%' + @ciudad + '%')
				AND dp.nombre LIKE('%' + @estado + '%')
				AND p.nombre LIKE('%' + @pais + '%')

	
	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
--execute Produccion.SP_busca_cliente 'r','m','',''
--select * from produccion.producto
GO
USE [master]
GO
ALTER DATABASE [BLV] SET  READ_WRITE 
GO
