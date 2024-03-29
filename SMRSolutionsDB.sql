USE [master]
GO

/****** Yessica De la Rosa  20-EIIN-1-064       ******/
/****** Blas Eduardo Miceli Perez 20-EIIN-1-057 ******/
/****** Soribel De Jesús Figuereo 20-EIIN-1-081 ******/


/****** Object:  Database [SMRSolutions]    Script Date: 3/8/2021 6:30:28 p. m. ******/
CREATE DATABASE [SMRSolutions]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SMRSolutions', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.BMiceli\MSSQL\DATA\SMRSolutions.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SMRSolutions_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.BMiceli\MSSQL\DATA\SMRSolutions_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SMRSolutions] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SMRSolutions].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SMRSolutions] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SMRSolutions] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SMRSolutions] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SMRSolutions] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SMRSolutions] SET ARITHABORT OFF 
GO
ALTER DATABASE [SMRSolutions] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SMRSolutions] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SMRSolutions] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SMRSolutions] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SMRSolutions] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SMRSolutions] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SMRSolutions] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SMRSolutions] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SMRSolutions] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SMRSolutions] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SMRSolutions] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SMRSolutions] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SMRSolutions] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SMRSolutions] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SMRSolutions] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SMRSolutions] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SMRSolutions] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SMRSolutions] SET RECOVERY FULL 
GO
ALTER DATABASE [SMRSolutions] SET  MULTI_USER 
GO
ALTER DATABASE [SMRSolutions] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SMRSolutions] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SMRSolutions] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SMRSolutions] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SMRSolutions] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SMRSolutions] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SMRSolutions', N'ON'
GO
ALTER DATABASE [SMRSolutions] SET QUERY_STORE = OFF
GO
USE [SMRSolutions]
GO
/****** Object:  Table [dbo].[Cargos]    Script Date: 3/8/2021 6:30:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargos](
	[Id_Cargo] [tinyint] IDENTITY(1,1) NOT NULL,
	[Cargo_Nombre] [varchar](100) NOT NULL,
	[Cargo_Descripcion] [varchar](250) NULL,
	[Cargo_Nivel] [tinyint] NOT NULL,
 CONSTRAINT [PK_CARGOS] PRIMARY KEY CLUSTERED 
(
	[Id_Cargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 3/8/2021 6:30:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_Nombre] [varchar](255) NOT NULL,
	[Cliente_RNC_O_Cedula] [varchar](15) NOT NULL,
	[Cliente_Direccion] [varchar](250) NOT NULL,
	[Cliente_Telefono] [varchar](10) NOT NULL,
 CONSTRAINT [PK_CLIENTES] PRIMARY KEY CLUSTERED 
(
	[Id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 3/8/2021 6:30:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[Id_Empleado] [int] IDENTITY(1,1) NOT NULL,
	[Empleado_Nombres] [varchar](60) NOT NULL,
	[Empleado_Apellidos] [varchar](100) NOT NULL,
	[Empleado_Cedula] [varchar](11) NOT NULL,
	[Empleado_Direccion] [varchar](150) NOT NULL,
	[Empleado_Telefono] [varchar](10) NOT NULL,
	[Empleado_Fecha_Nacimiento] [datetime] NOT NULL,
	[Empleado_Fecha_Ingreso] [datetime] NOT NULL,
	[Id_Cargo] [tinyint] NOT NULL,
	[Sueldo] [money] NOT NULL,
	[Id_Estatus_Empleado] [tinyint] NOT NULL,
 CONSTRAINT [PK_EMPLEADOS] PRIMARY KEY CLUSTERED 
(
	[Id_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados_Estatus]    Script Date: 3/8/2021 6:30:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados_Estatus](
	[Id_Estatus_Empleado] [tinyint] IDENTITY(1,1) NOT NULL,
	[Estatus_Nombre] [varchar](60) NOT NULL,
	[Estatus_Descripcion] [varchar](150) NULL,
 CONSTRAINT [PK_EMPLEADOS_ESTATUS] PRIMARY KEY CLUSTERED 
(
	[Id_Estatus_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 3/8/2021 6:30:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos](
	[Id_Permiso] [int] IDENTITY(1,1) NOT NULL,
	[Permiso_Nombre] [varchar](60) NOT NULL,
	[Permiso_Descripcion] [varchar](60) NULL,
 CONSTRAINT [PK_PERMISOS] PRIMARY KEY CLUSTERED 
(
	[Id_Permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permisos_Empleados]    Script Date: 3/8/2021 6:30:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos_Empleados](
	[Id_Permiso_Empleado] [int] IDENTITY(1,1) NOT NULL,
	[Id_Empleado] [int] NOT NULL,
	[Id_Permiso] [int] NOT NULL,
	[Permiso_Fecha_Efectividad] [datetime] NOT NULL,
	[Permiso_Fecha_Conclusion] [datetime] NULL,
 CONSTRAINT [PK_PERMISOS_EMPLEADOS] PRIMARY KEY CLUSTERED 
(
	[Id_Permiso_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proyectos]    Script Date: 3/8/2021 6:30:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proyectos](
	[Id_Proyecto] [int] IDENTITY(1,1) NOT NULL,
	[Proyecto_Nombre] [varchar](100) NOT NULL,
	[Proyecto_Descripcion] [varchar](250) NULL,
	[Proyecto_Fecha_Inicio] [datetime] NOT NULL,
	[Proyecto_Fecha_Fin] [datetime] NULL,
	[Id_Cliente] [int] NOT NULL,
	[Id_Estatus_Proyecto] [tinyint] NOT NULL,
 CONSTRAINT [PK_PROYECTOS] PRIMARY KEY CLUSTERED 
(
	[Id_Proyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proyectos_Estatus]    Script Date: 3/8/2021 6:30:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proyectos_Estatus](
	[Id_Estatus_Proyecto] [tinyint] IDENTITY(1,1) NOT NULL,
	[Estatus_Proyecto_Nombre] [varchar](50) NOT NULL,
	[Estatus_Proyecto_Descripcion] [varchar](150) NULL,
 CONSTRAINT [PK_PROYECTOS_ESTATUS] PRIMARY KEY CLUSTERED 
(
	[Id_Estatus_Proyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cargos] ON 

INSERT [dbo].[Cargos] ([Id_Cargo], [Cargo_Nombre], [Cargo_Descripcion], [Cargo_Nivel]) VALUES (1, N'Analista de Datos', N'El analista de datos es el perfil profesional que transforma los datos en información para poder llevar a cabo una toma de decisiones más completa. ', 2)
INSERT [dbo].[Cargos] ([Id_Cargo], [Cargo_Nombre], [Cargo_Descripcion], [Cargo_Nivel]) VALUES (2, N'Administrador de Base de datos', N'Es el responsable de administrar la base de datos', 2)
INSERT [dbo].[Cargos] ([Id_Cargo], [Cargo_Nombre], [Cargo_Descripcion], [Cargo_Nivel]) VALUES (3, N'Desarollador Móvil', N'Desarrolla la aplicación móvil', 2)
INSERT [dbo].[Cargos] ([Id_Cargo], [Cargo_Nombre], [Cargo_Descripcion], [Cargo_Nivel]) VALUES (4, N'Desarrollador Web', N'Desarrolla la aplicación Web', 2)
INSERT [dbo].[Cargos] ([Id_Cargo], [Cargo_Nombre], [Cargo_Descripcion], [Cargo_Nivel]) VALUES (5, N'Lider de equipo', N'', 2)
INSERT [dbo].[Cargos] ([Id_Cargo], [Cargo_Nombre], [Cargo_Descripcion], [Cargo_Nivel]) VALUES (6, N'QA', N'Realiza las pruebas del proyecto', 2)
INSERT [dbo].[Cargos] ([Id_Cargo], [Cargo_Nombre], [Cargo_Descripcion], [Cargo_Nivel]) VALUES (7, N'Diseñador ', N'DIseña las pantallas tanto de la web como de la móvil', 2)
INSERT [dbo].[Cargos] ([Id_Cargo], [Cargo_Nombre], [Cargo_Descripcion], [Cargo_Nivel]) VALUES (8, N'Arquitecto de software', N'Realiza la estructura de los proyectos a si como el proceso de despliegue', 2)
INSERT [dbo].[Cargos] ([Id_Cargo], [Cargo_Nombre], [Cargo_Descripcion], [Cargo_Nivel]) VALUES (9, N'Administrador de configuración', NULL, 2)
INSERT [dbo].[Cargos] ([Id_Cargo], [Cargo_Nombre], [Cargo_Descripcion], [Cargo_Nivel]) VALUES (10, N'Documentador', NULL, 3)
SET IDENTITY_INSERT [dbo].[Cargos] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([Id_Cliente], [Cliente_Nombre], [Cliente_RNC_O_Cedula], [Cliente_Direccion], [Cliente_Telefono]) VALUES (1, N'Jose Miguel Lombardo', N'22248969875', N'C/ la primera esq la segunda', N'8296532653')
INSERT [dbo].[Clientes] ([Id_Cliente], [Cliente_Nombre], [Cliente_RNC_O_Cedula], [Cliente_Direccion], [Cliente_Telefono]) VALUES (2, N'Banco BHD León', N'112365478', N'Ave. Tiradentes #19 Plaza Cibeles, D.N. Rep. Dom.', N'8292435000')
INSERT [dbo].[Clientes] ([Id_Cliente], [Cliente_Nombre], [Cliente_RNC_O_Cedula], [Cliente_Direccion], [Cliente_Telefono]) VALUES (3, N'Banco Popular Dominicano', N'456987632', N'Av. Independencia # 351, Santo Domingo', N'8095445500')
INSERT [dbo].[Clientes] ([Id_Cliente], [Cliente_Nombre], [Cliente_RNC_O_Cedula], [Cliente_Direccion], [Cliente_Telefono]) VALUES (4, N'Banco Vimenca', N'896321456', N'Av. Abraham Lincoln 306, Santo Domingo', N'8095329797')
INSERT [dbo].[Clientes] ([Id_Cliente], [Cliente_Nombre], [Cliente_RNC_O_Cedula], [Cliente_Direccion], [Cliente_Telefono]) VALUES (5, N'Banco Santa Cruz', N'752364124', N'Av. Máximo Gómez 15, Santo Domingo 10205', N'8096898756')
INSERT [dbo].[Clientes] ([Id_Cliente], [Cliente_Nombre], [Cliente_RNC_O_Cedula], [Cliente_Direccion], [Cliente_Telefono]) VALUES (6, N'Banco Caribe', N'156423756', N'Av 27 de Febrero No. 208, Santo Domingo 10122', N'8093780505')
INSERT [dbo].[Clientes] ([Id_Cliente], [Cliente_Nombre], [Cliente_RNC_O_Cedula], [Cliente_Direccion], [Cliente_Telefono]) VALUES (7, N'Banco BDI', N'456932145', N'Av Sarasota 27, Santo Domingo 10112', N'8095358586')
INSERT [dbo].[Clientes] ([Id_Cliente], [Cliente_Nombre], [Cliente_RNC_O_Cedula], [Cliente_Direccion], [Cliente_Telefono]) VALUES (8, N'Banco Ademi', N'785265123', N'Ave. México, casi esq. Enriquillo Edificio 33, Local 103, 1er. Piso, Av. Mexico, Santo Domingo 10217', N'8092213926')
INSERT [dbo].[Clientes] ([Id_Cliente], [Cliente_Nombre], [Cliente_RNC_O_Cedula], [Cliente_Direccion], [Cliente_Telefono]) VALUES (9, N'Asociación Popular de Ahorros y Préstamos', N'789562456', N'Mexico Av. México esq. Calle José Reyes, 1er. nivel, Santo Domingo', N'8096884022')
INSERT [dbo].[Clientes] ([Id_Cliente], [Cliente_Nombre], [Cliente_RNC_O_Cedula], [Cliente_Direccion], [Cliente_Telefono]) VALUES (10, N'Asociación Cibao', N'456123459', N'Av Simón Bolívar, Santo Domingo 10127
', N'8096899118')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleados] ON 

INSERT [dbo].[Empleados] ([Id_Empleado], [Empleado_Nombres], [Empleado_Apellidos], [Empleado_Cedula], [Empleado_Direccion], [Empleado_Telefono], [Empleado_Fecha_Nacimiento], [Empleado_Fecha_Ingreso], [Id_Cargo], [Sueldo], [Id_Estatus_Empleado]) VALUES (1, N'Alexander', N'Lorca', N'40245698745', N'C/ st Martha 2da. Sección', N'8298786542', CAST(N'1998-03-15T00:00:00.000' AS DateTime), CAST(N'2021-08-02T00:00:00.000' AS DateTime), 1, 15000.0000, 1)
INSERT [dbo].[Empleados] ([Id_Empleado], [Empleado_Nombres], [Empleado_Apellidos], [Empleado_Cedula], [Empleado_Direccion], [Empleado_Telefono], [Empleado_Fecha_Nacimiento], [Empleado_Fecha_Ingreso], [Id_Cargo], [Sueldo], [Id_Estatus_Empleado]) VALUES (2, N'Luis', N'Aguilar', N'22256478654', N'C/ Los angeles Ca. 2564', N'8094561234', CAST(N'1995-06-23T00:00:00.000' AS DateTime), CAST(N'2021-08-02T00:00:00.000' AS DateTime), 2, 18000.0000, 1)
INSERT [dbo].[Empleados] ([Id_Empleado], [Empleado_Nombres], [Empleado_Apellidos], [Empleado_Cedula], [Empleado_Direccion], [Empleado_Telefono], [Empleado_Fecha_Nacimiento], [Empleado_Fecha_Ingreso], [Id_Cargo], [Sueldo], [Id_Estatus_Empleado]) VALUES (3, N'Pedro', N'Gutíerrez', N'00156412345', N'C/ Alfredo del Mazo 2da. Seccion', N'8496541234', CAST(N'1996-02-12T00:00:00.000' AS DateTime), CAST(N'2021-08-03T18:11:21.860' AS DateTime), 3, 22000.0000, 3)
INSERT [dbo].[Empleados] ([Id_Empleado], [Empleado_Nombres], [Empleado_Apellidos], [Empleado_Cedula], [Empleado_Direccion], [Empleado_Telefono], [Empleado_Fecha_Nacimiento], [Empleado_Fecha_Ingreso], [Id_Cargo], [Sueldo], [Id_Estatus_Empleado]) VALUES (4, N'Armando', N'Tinoco', N'22245689845', N'C/ Bugambilias 34-A', N'8296512346', CAST(N'1999-06-17T00:00:00.000' AS DateTime), CAST(N'2021-08-03T18:13:38.227' AS DateTime), 4, 18000.0000, 1)
INSERT [dbo].[Empleados] ([Id_Empleado], [Empleado_Nombres], [Empleado_Apellidos], [Empleado_Cedula], [Empleado_Direccion], [Empleado_Telefono], [Empleado_Fecha_Nacimiento], [Empleado_Fecha_Ingreso], [Id_Cargo], [Sueldo], [Id_Estatus_Empleado]) VALUES (5, N'Fidel', N'Sosa', N'22545687984', N'C/ Valle Prado 67-j', N'8096216646', CAST(N'1988-09-12T00:00:00.000' AS DateTime), CAST(N'2021-08-03T18:14:33.977' AS DateTime), 5, 27000.0000, 1)
INSERT [dbo].[Empleados] ([Id_Empleado], [Empleado_Nombres], [Empleado_Apellidos], [Empleado_Cedula], [Empleado_Direccion], [Empleado_Telefono], [Empleado_Fecha_Nacimiento], [Empleado_Fecha_Ingreso], [Id_Cargo], [Sueldo], [Id_Estatus_Empleado]) VALUES (6, N'Mauro', N'Venegas', N'40299494916', N'C/ Moctezuma 88 2da. Cerrada', N'8097453126', CAST(N'2000-05-03T00:00:00.000' AS DateTime), CAST(N'2021-08-03T18:15:30.297' AS DateTime), 6, 19000.0000, 1)
INSERT [dbo].[Empleados] ([Id_Empleado], [Empleado_Nombres], [Empleado_Apellidos], [Empleado_Cedula], [Empleado_Direccion], [Empleado_Telefono], [Empleado_Fecha_Nacimiento], [Empleado_Fecha_Ingreso], [Id_Cargo], [Sueldo], [Id_Estatus_Empleado]) VALUES (7, N'Petra', N'Luna', N'40231265949', N'C/ Av Sur 45', N'8293154566', CAST(N'1996-12-15T00:00:00.000' AS DateTime), CAST(N'2021-08-03T18:16:19.320' AS DateTime), 7, 21560.0000, 1)
INSERT [dbo].[Empleados] ([Id_Empleado], [Empleado_Nombres], [Empleado_Apellidos], [Empleado_Cedula], [Empleado_Direccion], [Empleado_Telefono], [Empleado_Fecha_Nacimiento], [Empleado_Fecha_Ingreso], [Id_Cargo], [Sueldo], [Id_Estatus_Empleado]) VALUES (8, N'Miguel', N'Suaztes', N'40296321546', N'C/ Sor Juana s/n', N'8491264665', CAST(N'1999-11-09T00:00:00.000' AS DateTime), CAST(N'2021-08-03T18:17:03.500' AS DateTime), 8, 17500.0000, 1)
INSERT [dbo].[Empleados] ([Id_Empleado], [Empleado_Nombres], [Empleado_Apellidos], [Empleado_Cedula], [Empleado_Direccion], [Empleado_Telefono], [Empleado_Fecha_Nacimiento], [Empleado_Fecha_Ingreso], [Id_Cargo], [Sueldo], [Id_Estatus_Empleado]) VALUES (9, N'Jose', N'Mérida', N'40245454565', N'C/ Angosturas 345-L', N'8295654513', CAST(N'1998-09-15T00:00:00.000' AS DateTime), CAST(N'2021-08-03T18:20:09.683' AS DateTime), 9, 22000.0000, 4)
INSERT [dbo].[Empleados] ([Id_Empleado], [Empleado_Nombres], [Empleado_Apellidos], [Empleado_Cedula], [Empleado_Direccion], [Empleado_Telefono], [Empleado_Fecha_Nacimiento], [Empleado_Fecha_Ingreso], [Id_Cargo], [Sueldo], [Id_Estatus_Empleado]) VALUES (10, N'Lucio', N'Vega', N'00154896454', N'C/ Las alamedas 345 Priv 45', N'8299449499', CAST(N'1996-09-12T00:00:00.000' AS DateTime), CAST(N'2021-08-03T18:21:16.133' AS DateTime), 10, 15000.0000, 1)
SET IDENTITY_INSERT [dbo].[Empleados] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleados_Estatus] ON 

INSERT [dbo].[Empleados_Estatus] ([Id_Estatus_Empleado], [Estatus_Nombre], [Estatus_Descripcion]) VALUES (1, N'Activo', N'Indica que esta activo el empleado')
INSERT [dbo].[Empleados_Estatus] ([Id_Estatus_Empleado], [Estatus_Nombre], [Estatus_Descripcion]) VALUES (2, N'Inactivo', N'Indica que esta inactivo')
INSERT [dbo].[Empleados_Estatus] ([Id_Estatus_Empleado], [Estatus_Nombre], [Estatus_Descripcion]) VALUES (3, N'Vacaciones', N'Indica que esta de vacaciones')
INSERT [dbo].[Empleados_Estatus] ([Id_Estatus_Empleado], [Estatus_Nombre], [Estatus_Descripcion]) VALUES (4, N'Suspendido', N'Indica que esta suspendido')
SET IDENTITY_INSERT [dbo].[Empleados_Estatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Permisos] ON 

INSERT [dbo].[Permisos] ([Id_Permiso], [Permiso_Nombre], [Permiso_Descripcion]) VALUES (1, N'Ver proyectos', N'Poder ver los proyectos trabajados en la empresa')
INSERT [dbo].[Permisos] ([Id_Permiso], [Permiso_Nombre], [Permiso_Descripcion]) VALUES (2, N'Editar Proyectos', N'Poder editar proyectos')
INSERT [dbo].[Permisos] ([Id_Permiso], [Permiso_Nombre], [Permiso_Descripcion]) VALUES (3, N'Crear Proyectos', N'Poder crear proyectos')
INSERT [dbo].[Permisos] ([Id_Permiso], [Permiso_Nombre], [Permiso_Descripcion]) VALUES (4, N'Eliminar Proyectos', N'Poder eliminar proyectos')
INSERT [dbo].[Permisos] ([Id_Permiso], [Permiso_Nombre], [Permiso_Descripcion]) VALUES (5, N'Asignar Persona a proyectos', N'Poder asignar personas a proyectos')
INSERT [dbo].[Permisos] ([Id_Permiso], [Permiso_Nombre], [Permiso_Descripcion]) VALUES (6, N'Eliminar Persona a proyectos', N'Poder eliminar personas a proyectos')
INSERT [dbo].[Permisos] ([Id_Permiso], [Permiso_Nombre], [Permiso_Descripcion]) VALUES (7, N'Consulta Padrón', N'Poder consultar el padrón jce')
INSERT [dbo].[Permisos] ([Id_Permiso], [Permiso_Nombre], [Permiso_Descripcion]) VALUES (8, N'Asignar permiso', N'Poder asignar permisos')
INSERT [dbo].[Permisos] ([Id_Permiso], [Permiso_Nombre], [Permiso_Descripcion]) VALUES (9, N'Eliminar permiso', N'Poder eliminar permiso')
INSERT [dbo].[Permisos] ([Id_Permiso], [Permiso_Nombre], [Permiso_Descripcion]) VALUES (10, N'Ver Permiso ', N'Poder ver permiso')
SET IDENTITY_INSERT [dbo].[Permisos] OFF
GO
SET IDENTITY_INSERT [dbo].[Permisos_Empleados] ON 

INSERT [dbo].[Permisos_Empleados] ([Id_Permiso_Empleado], [Id_Empleado], [Id_Permiso], [Permiso_Fecha_Efectividad], [Permiso_Fecha_Conclusion]) VALUES (1, 1, 1, CAST(N'2021-08-03T18:23:58.950' AS DateTime), NULL)
INSERT [dbo].[Permisos_Empleados] ([Id_Permiso_Empleado], [Id_Empleado], [Id_Permiso], [Permiso_Fecha_Efectividad], [Permiso_Fecha_Conclusion]) VALUES (2, 1, 2, CAST(N'2021-08-03T18:24:03.400' AS DateTime), NULL)
INSERT [dbo].[Permisos_Empleados] ([Id_Permiso_Empleado], [Id_Empleado], [Id_Permiso], [Permiso_Fecha_Efectividad], [Permiso_Fecha_Conclusion]) VALUES (3, 1, 3, CAST(N'2021-08-03T18:24:08.507' AS DateTime), NULL)
INSERT [dbo].[Permisos_Empleados] ([Id_Permiso_Empleado], [Id_Empleado], [Id_Permiso], [Permiso_Fecha_Efectividad], [Permiso_Fecha_Conclusion]) VALUES (4, 1, 4, CAST(N'2021-08-03T18:24:12.307' AS DateTime), NULL)
INSERT [dbo].[Permisos_Empleados] ([Id_Permiso_Empleado], [Id_Empleado], [Id_Permiso], [Permiso_Fecha_Efectividad], [Permiso_Fecha_Conclusion]) VALUES (5, 2, 5, CAST(N'2021-08-03T18:24:50.587' AS DateTime), NULL)
INSERT [dbo].[Permisos_Empleados] ([Id_Permiso_Empleado], [Id_Empleado], [Id_Permiso], [Permiso_Fecha_Efectividad], [Permiso_Fecha_Conclusion]) VALUES (6, 2, 6, CAST(N'2021-08-03T18:24:54.700' AS DateTime), NULL)
INSERT [dbo].[Permisos_Empleados] ([Id_Permiso_Empleado], [Id_Empleado], [Id_Permiso], [Permiso_Fecha_Efectividad], [Permiso_Fecha_Conclusion]) VALUES (7, 6, 7, CAST(N'2021-08-03T18:24:58.727' AS DateTime), NULL)
INSERT [dbo].[Permisos_Empleados] ([Id_Permiso_Empleado], [Id_Empleado], [Id_Permiso], [Permiso_Fecha_Efectividad], [Permiso_Fecha_Conclusion]) VALUES (8, 4, 8, CAST(N'2021-08-03T18:25:08.367' AS DateTime), NULL)
INSERT [dbo].[Permisos_Empleados] ([Id_Permiso_Empleado], [Id_Empleado], [Id_Permiso], [Permiso_Fecha_Efectividad], [Permiso_Fecha_Conclusion]) VALUES (9, 4, 9, CAST(N'2021-08-03T18:25:11.120' AS DateTime), NULL)
INSERT [dbo].[Permisos_Empleados] ([Id_Permiso_Empleado], [Id_Empleado], [Id_Permiso], [Permiso_Fecha_Efectividad], [Permiso_Fecha_Conclusion]) VALUES (10, 4, 10, CAST(N'2021-08-03T18:25:14.513' AS DateTime), NULL)
INSERT [dbo].[Permisos_Empleados] ([Id_Permiso_Empleado], [Id_Empleado], [Id_Permiso], [Permiso_Fecha_Efectividad], [Permiso_Fecha_Conclusion]) VALUES (11, 5, 1, CAST(N'2021-08-03T18:25:19.980' AS DateTime), NULL)
INSERT [dbo].[Permisos_Empleados] ([Id_Permiso_Empleado], [Id_Empleado], [Id_Permiso], [Permiso_Fecha_Efectividad], [Permiso_Fecha_Conclusion]) VALUES (12, 5, 2, CAST(N'2021-08-03T18:25:23.337' AS DateTime), NULL)
INSERT [dbo].[Permisos_Empleados] ([Id_Permiso_Empleado], [Id_Empleado], [Id_Permiso], [Permiso_Fecha_Efectividad], [Permiso_Fecha_Conclusion]) VALUES (13, 5, 3, CAST(N'2021-08-03T18:25:25.497' AS DateTime), NULL)
INSERT [dbo].[Permisos_Empleados] ([Id_Permiso_Empleado], [Id_Empleado], [Id_Permiso], [Permiso_Fecha_Efectividad], [Permiso_Fecha_Conclusion]) VALUES (14, 5, 4, CAST(N'2021-08-03T18:25:27.747' AS DateTime), NULL)
INSERT [dbo].[Permisos_Empleados] ([Id_Permiso_Empleado], [Id_Empleado], [Id_Permiso], [Permiso_Fecha_Efectividad], [Permiso_Fecha_Conclusion]) VALUES (15, 5, 5, CAST(N'2021-08-03T18:25:31.130' AS DateTime), NULL)
INSERT [dbo].[Permisos_Empleados] ([Id_Permiso_Empleado], [Id_Empleado], [Id_Permiso], [Permiso_Fecha_Efectividad], [Permiso_Fecha_Conclusion]) VALUES (16, 5, 6, CAST(N'2021-08-03T18:25:35.890' AS DateTime), NULL)
INSERT [dbo].[Permisos_Empleados] ([Id_Permiso_Empleado], [Id_Empleado], [Id_Permiso], [Permiso_Fecha_Efectividad], [Permiso_Fecha_Conclusion]) VALUES (17, 5, 8, CAST(N'2021-08-03T18:25:42.133' AS DateTime), NULL)
INSERT [dbo].[Permisos_Empleados] ([Id_Permiso_Empleado], [Id_Empleado], [Id_Permiso], [Permiso_Fecha_Efectividad], [Permiso_Fecha_Conclusion]) VALUES (18, 5, 9, CAST(N'2021-08-03T18:26:04.487' AS DateTime), NULL)
INSERT [dbo].[Permisos_Empleados] ([Id_Permiso_Empleado], [Id_Empleado], [Id_Permiso], [Permiso_Fecha_Efectividad], [Permiso_Fecha_Conclusion]) VALUES (19, 5, 10, CAST(N'2021-08-03T18:26:07.227' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Permisos_Empleados] OFF
GO
SET IDENTITY_INSERT [dbo].[Proyectos] ON 

INSERT [dbo].[Proyectos] ([Id_Proyecto], [Proyecto_Nombre], [Proyecto_Descripcion], [Proyecto_Fecha_Inicio], [Proyecto_Fecha_Fin], [Id_Cliente], [Id_Estatus_Proyecto]) VALUES (1, N'Apap Web', N'pagina web de apap', CAST(N'2021-05-03T00:00:00.000' AS DateTime), NULL, 9, 1)
INSERT [dbo].[Proyectos] ([Id_Proyecto], [Proyecto_Nombre], [Proyecto_Descripcion], [Proyecto_Fecha_Inicio], [Proyecto_Fecha_Fin], [Id_Cliente], [Id_Estatus_Proyecto]) VALUES (2, N'Apap Móvil', N'app móvil apap', CAST(N'2021-05-18T00:00:00.000' AS DateTime), NULL, 9, 3)
INSERT [dbo].[Proyectos] ([Id_Proyecto], [Proyecto_Nombre], [Proyecto_Descripcion], [Proyecto_Fecha_Inicio], [Proyecto_Fecha_Fin], [Id_Cliente], [Id_Estatus_Proyecto]) VALUES (3, N'Popular en linea', N'aplicación web Popular', CAST(N'2021-06-24T00:00:00.000' AS DateTime), NULL, 3, 2)
INSERT [dbo].[Proyectos] ([Id_Proyecto], [Proyecto_Nombre], [Proyecto_Descripcion], [Proyecto_Fecha_Inicio], [Proyecto_Fecha_Fin], [Id_Cliente], [Id_Estatus_Proyecto]) VALUES (4, N'Popular APP', N'Aplicación movil de popular', CAST(N'2021-03-18T00:00:00.000' AS DateTime), NULL, 3, 4)
INSERT [dbo].[Proyectos] ([Id_Proyecto], [Proyecto_Nombre], [Proyecto_Descripcion], [Proyecto_Fecha_Inicio], [Proyecto_Fecha_Fin], [Id_Cliente], [Id_Estatus_Proyecto]) VALUES (5, N'BHD Web', N'Aplicación web de BHD León', CAST(N'2021-07-12T00:00:00.000' AS DateTime), NULL, 2, 6)
INSERT [dbo].[Proyectos] ([Id_Proyecto], [Proyecto_Nombre], [Proyecto_Descripcion], [Proyecto_Fecha_Inicio], [Proyecto_Fecha_Fin], [Id_Cliente], [Id_Estatus_Proyecto]) VALUES (6, N'BHD Móvil', N'Aplicación móvil de BHD León ', CAST(N'2021-04-03T00:00:00.000' AS DateTime), NULL, 2, 3)
INSERT [dbo].[Proyectos] ([Id_Proyecto], [Proyecto_Nombre], [Proyecto_Descripcion], [Proyecto_Fecha_Inicio], [Proyecto_Fecha_Fin], [Id_Cliente], [Id_Estatus_Proyecto]) VALUES (7, N'Vimenca Contigo', N'Aplicación web de Banco Vimenca', CAST(N'2021-06-18T00:00:00.000' AS DateTime), NULL, 4, 1)
INSERT [dbo].[Proyectos] ([Id_Proyecto], [Proyecto_Nombre], [Proyecto_Descripcion], [Proyecto_Fecha_Inicio], [Proyecto_Fecha_Fin], [Id_Cliente], [Id_Estatus_Proyecto]) VALUES (8, N'Ademi APP', N'Aplicación Móvil ADEMI', CAST(N'2021-06-12T00:00:00.000' AS DateTime), NULL, 8, 2)
INSERT [dbo].[Proyectos] ([Id_Proyecto], [Proyecto_Nombre], [Proyecto_Descripcion], [Proyecto_Fecha_Inicio], [Proyecto_Fecha_Fin], [Id_Cliente], [Id_Estatus_Proyecto]) VALUES (9, N'Bancanet', N'Aplicacion web banco santa cruz', CAST(N'2020-11-12T00:00:00.000' AS DateTime), NULL, 5, 4)
INSERT [dbo].[Proyectos] ([Id_Proyecto], [Proyecto_Nombre], [Proyecto_Descripcion], [Proyecto_Fecha_Inicio], [Proyecto_Fecha_Fin], [Id_Cliente], [Id_Estatus_Proyecto]) VALUES (10, N'BDI NET', N'Aplicación web BDI', CAST(N'2021-02-10T00:00:00.000' AS DateTime), NULL, 7, 6)
SET IDENTITY_INSERT [dbo].[Proyectos] OFF
GO
SET IDENTITY_INSERT [dbo].[Proyectos_Estatus] ON 

INSERT [dbo].[Proyectos_Estatus] ([Id_Estatus_Proyecto], [Estatus_Proyecto_Nombre], [Estatus_Proyecto_Descripcion]) VALUES (1, N'Pendiente de aprobación', N'Este proyecto la empresa no lo aceptado')
INSERT [dbo].[Proyectos_Estatus] ([Id_Estatus_Proyecto], [Estatus_Proyecto_Nombre], [Estatus_Proyecto_Descripcion]) VALUES (2, N'Pendiente de desarrollo', N'Este está pendiente de desarollo')
INSERT [dbo].[Proyectos_Estatus] ([Id_Estatus_Proyecto], [Estatus_Proyecto_Nombre], [Estatus_Proyecto_Descripcion]) VALUES (3, N'En curso', N'El proyecto esta en desarrollo')
INSERT [dbo].[Proyectos_Estatus] ([Id_Estatus_Proyecto], [Estatus_Proyecto_Nombre], [Estatus_Proyecto_Descripcion]) VALUES (4, N'Completado', N'El proyecto se ha completado')
INSERT [dbo].[Proyectos_Estatus] ([Id_Estatus_Proyecto], [Estatus_Proyecto_Nombre], [Estatus_Proyecto_Descripcion]) VALUES (5, N'Cancelado', N'El proyecto ha sido cancelado')
INSERT [dbo].[Proyectos_Estatus] ([Id_Estatus_Proyecto], [Estatus_Proyecto_Nombre], [Estatus_Proyecto_Descripcion]) VALUES (6, N'Rechazado', N'El proyecto ha sido rechazado por la empresa')
SET IDENTITY_INSERT [dbo].[Proyectos_Estatus] OFF
GO
ALTER TABLE [dbo].[Empleados] ADD  CONSTRAINT [DF_Empleados_Empleado_Fecha_Ingreso]  DEFAULT (getdate()) FOR [Empleado_Fecha_Ingreso]
GO
ALTER TABLE [dbo].[Permisos_Empleados] ADD  CONSTRAINT [DF_Permisos_Empleados_Permiso_Fecha_Efectividad]  DEFAULT (getdate()) FOR [Permiso_Fecha_Efectividad]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [Empleados_fk0] FOREIGN KEY([Id_Cargo])
REFERENCES [dbo].[Cargos] ([Id_Cargo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [Empleados_fk0]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [Empleados_fk1] FOREIGN KEY([Id_Estatus_Empleado])
REFERENCES [dbo].[Empleados_Estatus] ([Id_Estatus_Empleado])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [Empleados_fk1]
GO
ALTER TABLE [dbo].[Permisos_Empleados]  WITH CHECK ADD  CONSTRAINT [Permisos_Empleados_fk0] FOREIGN KEY([Id_Empleado])
REFERENCES [dbo].[Empleados] ([Id_Empleado])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Permisos_Empleados] CHECK CONSTRAINT [Permisos_Empleados_fk0]
GO
ALTER TABLE [dbo].[Permisos_Empleados]  WITH CHECK ADD  CONSTRAINT [Permisos_Empleados_fk1] FOREIGN KEY([Id_Permiso])
REFERENCES [dbo].[Permisos] ([Id_Permiso])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Permisos_Empleados] CHECK CONSTRAINT [Permisos_Empleados_fk1]
GO
ALTER TABLE [dbo].[Proyectos]  WITH CHECK ADD  CONSTRAINT [Proyectos_fk0] FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Clientes] ([Id_Cliente])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Proyectos] CHECK CONSTRAINT [Proyectos_fk0]
GO
ALTER TABLE [dbo].[Proyectos]  WITH CHECK ADD  CONSTRAINT [Proyectos_fk1] FOREIGN KEY([Id_Estatus_Proyecto])
REFERENCES [dbo].[Proyectos_Estatus] ([Id_Estatus_Proyecto])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Proyectos] CHECK CONSTRAINT [Proyectos_fk1]
GO
USE [master]
GO
ALTER DATABASE [SMRSolutions] SET  READ_WRITE 
GO
