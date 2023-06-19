USE [master]
GO
/****** Object:  Database [BLV]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Schema [Compra]    Script Date: 19/6/2023 2:58:15 p. m. ******/
CREATE SCHEMA [Compra]
GO
/****** Object:  Schema [Costo]    Script Date: 19/6/2023 2:58:15 p. m. ******/
CREATE SCHEMA [Costo]
GO
/****** Object:  Schema [Importacion]    Script Date: 19/6/2023 2:58:15 p. m. ******/
CREATE SCHEMA [Importacion]
GO
/****** Object:  Schema [Parametro]    Script Date: 19/6/2023 2:58:15 p. m. ******/
CREATE SCHEMA [Parametro]
GO
/****** Object:  Schema [Proceso]    Script Date: 19/6/2023 2:58:15 p. m. ******/
CREATE SCHEMA [Proceso]
GO
/****** Object:  Schema [Produccion]    Script Date: 19/6/2023 2:58:15 p. m. ******/
CREATE SCHEMA [Produccion]
GO
/****** Object:  Schema [Relacion]    Script Date: 19/6/2023 2:58:15 p. m. ******/
CREATE SCHEMA [Relacion]
GO
/****** Object:  Schema [Sistema]    Script Date: 19/6/2023 2:58:15 p. m. ******/
CREATE SCHEMA [Sistema]
GO
/****** Object:  Schema [Venta]    Script Date: 19/6/2023 2:58:15 p. m. ******/
CREATE SCHEMA [Venta]
GO
/****** Object:  Table [Produccion].[Medida]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  View [Sistema].[vw_medida]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Produccion].[Capacidad_Envase]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Produccion].[Empaque]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  View [Sistema].[vw_empaque]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Pais_Continente]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Sistema].[Division_Politica]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Sistema].[Pais]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Sistema].[Ciudad]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Sistema].[Continente]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[DP_Ciudad]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Pais_DP]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  View [Sistema].[vw_ciudades]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Deposito_Ciudad]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Sistema].[Deposito]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  View [Sistema].[VW_Depositos]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Compra].[Certificado_Circulacion]    Script Date: 19/6/2023 2:58:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compra].[Certificado_Circulacion](
	[id_certificado_circulacion] [int] IDENTITY(1,1) NOT NULL,
	[certificado_circulacion] [nvarchar](255) NULL,
	[fecha_certificado_circulacion] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Compra].[Lote]    Script Date: 19/6/2023 2:58:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compra].[Lote](
	[id_batch] [int] IDENTITY(1,1) NOT NULL,
	[codigo_lote] [varchar](10) NULL,
	[certificado_analisis] [nvarchar](255) NULL,
	[fecha_certificado_analisis] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_batch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Compra].[OC_Insumo_Header]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Compra].[Orden_Compra]    Script Date: 19/6/2023 2:58:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Compra].[Orden_Compra](
	[id_orden_compra] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [smalldatetime] NULL,
	[codigo_importacion] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_orden_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Compra].[orden_compra_insumo]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Compra].[Orden_Compra_Producto]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Compra].[Proveedor]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Costo].[Concepto_Header]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Costo].[Perfil_Costo]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Costo].[Secuencia_Perfil]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Costo].[Tasa_Concepto]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Costo].[Tipo_Concepto]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Costo].[Tipo_Valor]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Parametro].[Certificado]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Parametro].[Compra]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Parametro].[Ruta]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Proceso].[Costo_a_Calcular]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Proceso].[Estado]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Proceso].[Hoja_Fabricacion]    Script Date: 19/6/2023 2:58:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Hoja_Fabricacion](
	[id_proceso_hf] [int] IDENTITY(1,1) NOT NULL,
	[id_hoja_fabrica] [int] NULL,
	[id_producto] [int] NULL,
	[cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_proceso_hf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[Relacion_Tablones]    Script Date: 19/6/2023 2:58:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Relacion_Tablones](
	[id_tablon_impacto_stock] [int] NULL,
	[id_tablon_impacto_deposito] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[Tablon_Impacto_Deposito]    Script Date: 19/6/2023 2:58:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Tablon_Impacto_Deposito](
	[id_tablon_impacto_deposito] [int] IDENTITY(1,1) NOT NULL,
	[id_deposito] [int] NULL,
	[id_stock] [int] NULL,
	[es_cuarentena] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[Tablon_Impacto_Stock]    Script Date: 19/6/2023 2:58:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Tablon_Impacto_Stock](
	[id_tablon_impacto_stock] [int] IDENTITY(1,1) NOT NULL,
	[id_compra] [int] NULL,
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
/****** Object:  Table [Produccion].[Hoja_Fabricacion_Header]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Produccion].[Producto]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Produccion].[Producto_Header]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Produccion].[Producto_Marca]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Produccion].[Receta]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Produccion].[Stock]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Produccion].[Stock_Insumo]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Cliente_ciudad]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Compra_Estado]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Costo_oc]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Deposito_Stock]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Derecho_importacion_Producto]    Script Date: 19/6/2023 2:58:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Derecho_importacion_Producto](
	[id_derecho_importacion_producto] [int] IDENTITY(1,1) NOT NULL,
	[id_concepto] [int] NULL,
	[codigo_producto] [varchar](10) NULL,
	[codigo_arancelario] [nchar](7) NULL,
	[tasa] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_derecho_importacion_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Elaborador_Localidad]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Entidad_Bancaria_Ciudad]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Envio_Estado]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Hoja_Fab_Estado]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Ingrediente_Stock]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Localidad_Ciudad]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Lote_Certificado_Circulacion]    Script Date: 19/6/2023 2:58:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Lote_Certificado_Circulacion](
	[id_lote_certificado_circulacion] [int] IDENTITY(1,1) NOT NULL,
	[id_batch] [int] NULL,
	[id_certificado_circulacion] [int] NULL,
	[fecha_impacto] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Lote_Ingrediente]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Lote_Producto]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Lote_Stock]    Script Date: 19/6/2023 2:58:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Lote_Stock](
	[id_lote_stock] [int] IDENTITY(1,1) NOT NULL,
	[id_batch] [int] NULL,
	[id_stock] [int] NULL,
	[fecha_impacto] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_lote_stock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Medio_Pago_Cuenta]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Medio_Pago_Orden_Compra]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Moneda_Orden_Compra]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[OC_Producto_Empaque]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[OC_Producto_Medida]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Orden_Compra_Envio]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Orden_Compra_Lote]    Script Date: 19/6/2023 2:58:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Relacion].[Orden_Compra_Lote](
	[id_orden_compra_lote] [int] IDENTITY(1,1) NOT NULL,
	[id_orden_compra] [int] NULL,
	[id_lote] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_orden_compra_lote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Relacion].[Pais_Ciudad]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Perfil_Concepto]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Producto_Compra]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Producto_Elaborador]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Producto_Hoja_Fabrica]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Producto_Importador]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Producto_Marca]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Producto_Procedencia]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Producto_Receta]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Producto_Venta]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Proveedor_Ciudad]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Proveedor_OrdenCompra]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Stock_Cuarentena]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Usuario_Localidad]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Usuario_Pass]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Usuario_Perfil_Acceso]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Venta_Cliente]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Venta_Envio]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Relacion].[Venta_Remito]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Sistema].[Acceso]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Sistema].[Cuenta]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Sistema].[Entidad_Bancaria]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Sistema].[Envio]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Sistema].[Estado]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Sistema].[Localidad]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Sistema].[Logs]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Sistema].[Medio_Pago]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Sistema].[Moneda]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Sistema].[Pass]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Sistema].[Perfil]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Sistema].[Usuario]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Venta].[Cliente]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Venta].[Envio]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Venta].[Orden_Venta]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  Table [Venta].[Remito]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
ALTER TABLE [Sistema].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Banco_Cuenta] FOREIGN KEY([id_banco])
REFERENCES [Sistema].[Entidad_Bancaria] ([id_banco])
GO
ALTER TABLE [Sistema].[Cuenta] CHECK CONSTRAINT [FK_Banco_Cuenta]
GO
/****** Object:  StoredProcedure [Compra].[SP_Agrega_Producto_OC]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Compra].[SP_Busca_Costo]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Compra].[SP_Busca_Fecha_Inicial_Compra]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Compra].[SP_Busca_Ordenes_Compra]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Compra].[SP_Busca_Ordenes_Compra_LIKE]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Compra].[SP_Busca_Proveedor]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Compra].[SP_Cambia_Estado_OC]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Compra].[SP_Carga_Costo]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Compra].[SP_Genera_OC]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Compra].[SP_Ingresar_Proveedor]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Compra].[SP_Monto_OC]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Compra].[SP_Orden_Compra_Detalle]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Compra].[SP_Orden_Compra_Detalle_Cuarentena]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Compra].[SP_Orden_Compra_Producto]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Costo].[Calculador_Costo_Compra]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Costo].[Impacta_Valor_Carga]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Costo].[SP_Agregar_Concepto_Perfil_Costo]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Costo].[SP_Agregar_Perfil_Costo]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Costo].[SP_Busca_Concepto_Arancelario]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Costo].[SP_Busca_Detalle_Perfil_Costo]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Costo].[SP_Busca_Id_Enlace]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Costo].[SP_Busca_Perfil_Costo]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Costo].[SP_Busca_Perfil_Costo_Generico]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Costo].[SP_Detalle_Costo_Manual]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Parametro].[SP_Busca_Valor_Ruta]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Proceso].[SP_Busca_Numero_Importacion]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Proceso].[SP_Impactar_Tablon_Stock_001]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
		
		
		
		
		

	

		COMMIT;
	END TRY
	BEGIN CATCH
		
		
		ROLLBACK;
	END CATCH
GO
/****** Object:  StoredProcedure [Proceso].[SP_Impactar_Tablon_Stock_002]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Proceso].[SP_Impactar_Tablon_Stock_003]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
			,es_cuarentena)
		VALUES(
			@id_deposito
			,@id_stock
			,@es_cuarentena)
	
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
/****** Object:  StoredProcedure [Proceso].[SP_Impactar_Tablon_Stock_004]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Proceso].[SP_Obtener_Producto_Sin_Asignar]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Proceso].[SP_Orden_Compra_Tablon]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[Consulta_Insumo_Stock]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[Consulta_Producto_Cuarentena]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[Consulta_Producto_Stock]    Script Date: 19/6/2023 2:58:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[Consulta_Producto_Stock]

AS
	BEGIN TRY


		



		SELECT
			p.codigo_producto AS 'CODIGO DE PRODUCTO'
			,ph.nombre_producto AS 'NOMBRE DE PRODUCTO'
			,sum(lp.cantidad) AS 'EXISTENCIA EN STOCK'
			,sum(isnull(phf.cantidad,0)) AS 'COMPROMETIDO'
			,m.descripcion AS 'MEDIDA'
			,ce.capacidad AS 'CAPACIDAD ENVASE'
			,e.descripcion AS 'EMPAQUE'


		FROM 
		
			Produccion.Producto_Header ph
			INNER JOIN Produccion.Producto p ON p.codigo_producto=ph.codigo_producto
			INNER JOIN Relacion.Lote_Producto lp ON lp.id_producto=p.id_producto
			INNER JOIN Produccion.Medida m ON m.id_medida=lp.id_medida
			INNER JOIN Produccion.Empaque e ON e.id_empaque=lp.id_empaque
			INNER JOIN Produccion.Capacidad_Envase ce ON ce.id_capacidad_envase=lp.id_capacidad_envase
			LEFT JOIN Proceso.Hoja_Fabricacion PHF ON phf.id_producto=p.id_producto
		WHERE
			lp.cuarentena=0
		group by 
			p.codigo_producto
			,ph.nombre_producto
			,ce.capacidad 
			,m.descripcion
			,e.descripcion

	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH


	;


GO
/****** Object:  StoredProcedure [Produccion].[Consulta_Producto_Stock_Detalle]    Script Date: 19/6/2023 2:58:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[Consulta_Producto_Stock_Detalle]
	@codigo_producto varchar(10)
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
			p.codigo_producto= @codigo_producto
			AND lp.cuarentena=0
		ORDER BY
			p.fecha_vencimiento
		;

	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
GO
/****** Object:  StoredProcedure [Produccion].[Consulta_Producto_Stock_Fabricacion]    Script Date: 19/6/2023 2:58:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [Produccion].[Consulta_Producto_Stock_Fabricacion]
	@codigo_producto varchar(10)

AS
	BEGIN TRY

		SELECT
			l.codigo_lote AS 'CODIGO DE LOTE'
			,ph.codigo_producto AS 'CODIGO DE PRODUCTO'
			,ph.nombre_producto AS 'NOMBRE DE PRODUCTO'
			,p.marca AS 'MARCA'
			,IIF(lp.cuarentena=1,'SI','NO') AS 'CUARENTENA'
			,p.fecha_vencimiento AS 'FECHA DE VENCIMIENTO'
			,lp.cantidad-sum(convert(int,isnull(PHF.cantidad,0))) AS 'EXISTENCIA EN STOCK'
			,sum(convert(int,isnull(PHF.cantidad,0))) AS 'COMPROMETIDO'
			,m.descripcion AS 'MEDIDA'
			

		FROM 
			Produccion.Producto_Header ph
			INNER JOIN Produccion.Producto p ON p.codigo_producto=ph.codigo_producto
			INNER JOIN Relacion.Lote_Producto lp ON lp.id_producto=p.id_producto
			INNER JOIN Compra.Lote l ON l.id_batch=lp.id_batch
			INNER JOIN Produccion.Medida m ON m.id_medida=lp.id_medida
			LEFT JOIN Proceso.Hoja_Fabricacion PHF ON PHF.id_producto=p.id_producto


		WHERE
			p.codigo_producto=@codigo_producto 
			
		GROUP BY
			l.codigo_lote 
			,ph.codigo_producto
			,ph.nombre_producto
			,p.marca
			,p.fecha_vencimiento
			,lp.cantidad
			,lp.cuarentena
			,m.descripcion
		HAVING  (lp.cantidad-sum(convert(int,isnull(PHF.cantidad,0))))>0
	
		ORDER BY
			lp.cuarentena DESC
			,p.fecha_vencimiento
		;

	END TRY
	BEGIN CATCH
		print @@ERROR;


	END CATCH
GO
/****** Object:  StoredProcedure [Produccion].[Consulta_Producto_Stock_Fabricacion_Restante]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[Consulta_Producto_Stock_Lote]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Agrega_Producto_HF]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Alta_Nuevo_Producto]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Capacidad_Empaque]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Capacidad_Empaque_disponible]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Codigo_Arancelario]    Script Date: 19/6/2023 2:58:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[SP_Busca_Codigo_Arancelario]
		@codigo_producto VARCHAR(10)
		,@codigo_arancelario  nVARCHAR(12)=null OUT
		,@tasa float=0 OUT
AS
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
						tasa 
					FROM 
						relacion.Derecho_importacion_Producto
					WHERE
						codigo_arancelario=@codigo_arancelario);

			END

	END TRY
	BEGIN CATCH
		print @@error
	END CATCH
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Codigo_Producto]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Descripcion_Producto]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Detalle_Cantidad_Ingrediente]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Detalle_Receta]    Script Date: 19/6/2023 2:58:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[SP_Busca_Detalle_Receta]
	@codigo_producto VARCHAR(10)
AS
	BEGIN TRY
		SELECT
			pp.codigo_producto AS 'CODIGO INGREDIENTE'
			,P.nombre_producto AS 'NOMBRE INGREDIENTE'
			,pr.cantidad_percentil AS 'PORCENTAJE EN FORMULA'
			,convert(int,(SUM(isnull(lp.cantidad,0)))-convert(int,SUM(isnull(phf.cantidad,0)))) AS 'DISPONIBLE'
			,convert(int,SUM(isnull(phf.cantidad,0))) AS 'COMPROMETIDO'
	
	
		FROM
			produccion.receta R
			INNER JOIN relacion.Producto_Receta pr ON pr.id_receta=r.id_receta
			INNER JOIN produccion.producto pp ON pp.codigo_producto=pr.codigo_ingrediente_producto
			INNER JOIN Produccion.Producto_header P ON P.codigo_producto= pp.codigo_producto
			LEFT JOIN proceso.Hoja_Fabricacion PHF ON PHF.id_producto=PP.id_producto
			INNER JOIN relacion.Lote_Producto LP ON LP.id_producto=pp.id_producto
		WHERE
			R.codigo_producto=@codigo_producto

		GROUP BY
			pp.codigo_producto 
			,r.nombre_receta
			,pr.cantidad_percentil
			,P.nombre_producto
	END TRY
	BEGIN CATCH
		print @@error;
	END CATCH

	--execute produccion.sp_busca_detalle_receta 'FAB042'
GO
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Empaque]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Empaque_Disponible]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Fecha_Inicial_Elaboracion]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Fecha_Inicial_Vencimiento]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Marca]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Medida]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Producto]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Producto_generico]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Producto_header]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Producto_Sistema_Header]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Receta]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Busca_Receta_Gestion]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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


			SELECT 
				
				r.codigo_producto AS 'CODIGO A FABRICAR'
				,r.nombre_receta AS 'NOMBRE DE RECETA'
				,pr.codigo_ingrediente_producto as 'CODIGO INGREDIENTES'
				,(Select nombre_producto FROM Produccion.Producto_Header WHERE codigo_producto=pr.codigo_ingrediente_producto) AS 'INGREDIENTES'
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
/****** Object:  StoredProcedure [Produccion].[SP_Crear_Hoja_Fabricacion]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Estado_Stock]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Impactar_Stock]    Script Date: 19/6/2023 2:58:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Produccion].[SP_Impactar_Stock]
	@id_orden_compra int
	,@codigo_lote varchar(10)
	,@fecha_certificado_analisis smalldatetime
	,@certificado_analisis nvarchar(255)
	,@fecha_certificado_circulacion smalldatetime
	,@certificado_circulacion nvarchar(255)
	,@id_lote int OUT
AS

	DECLARE @id_certificado_circulacion INT;

	BEGIN TRAN

		BEGIN TRY
		 
			INSERT INTO Compra.Lote(
				codigo_lote
				,fecha_certificado_analisis
				,certificado_analisis

			)VALUES
			(
				@codigo_lote
				,@fecha_certificado_analisis
				,@certificado_analisis
			);

			SET @id_lote=SCOPE_IDENTITY();

			INSERT INTO Compra.Certificado_Circulacion(
				certificado_circulacion
				,fecha_certificado_circulacion
			)VALUES
			(
				@certificado_circulacion
				,@fecha_certificado_circulacion
				
			)

			SET @id_certificado_circulacion=SCOPE_IDENTITY();

			INSERT INTO Relacion.Orden_Compra_Lote(
				id_orden_compra
				,id_lote
			)VALUES
			(
				@id_orden_compra
				,@id_lote
			);
			
			INSERT INTO Relacion.Lote_Certificado_Circulacion(
				id_batch
				,id_certificado_circulacion
				,fecha_impacto
			)VALUES
			(
				@id_lote
				,@id_certificado_circulacion
				,getdate()

			);

			
			COMMIT;

		END TRY
		BEGIN CATCH
			SET @id_lote=0;
			print @@error;
			ROLLBACK;
		END CATCH
GO
/****** Object:  StoredProcedure [Produccion].[SP_Impactar_Stock_Cuarentena]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Impactar_Stock_Paso_Dos]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Impactar_Stock_Paso_Tres]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Ingresar_Producto]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Obtener_Id_Producto]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Selector_Batch]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Stock]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Produccion].[SP_Verifica_Stock_Insumo]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Sistema].[SP_busca_acceso]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Sistema].[SP_Busca_Deposito]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Sistema].[SP_Busca_Envio]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Sistema].[SP_Busca_Estados]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Sistema].[SP_Busca_ID_Ciudad]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Sistema].[SP_Busca_ID_Estado]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Sistema].[SP_Busca_ID_Proveedor]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Sistema].[SP_Busca_Medio_Pago]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Sistema].[SP_Busca_Moneda]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Sistema].[SP_Busca_Pais]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Sistema].[SP_Busca_Posiciones_Deposito]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Sistema].[SP_busca_usuario]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Sistema].[SP_Buscar_Locacion]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Sistema].[SP_Carga_Grilla_Deposito]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
/****** Object:  StoredProcedure [Venta].[SP_Busca_Cliente]    Script Date: 19/6/2023 2:58:15 p. m. ******/
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
