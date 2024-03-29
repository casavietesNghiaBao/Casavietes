USE [master]
GO
/****** Object:  Database [WebsiteNhaHang]    Script Date: 1/3/2021 21:41:40 ******/
CREATE DATABASE [WebsiteNhaHang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebsiteNhaHang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WebsiteNhaHang.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WebsiteNhaHang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WebsiteNhaHang_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WebsiteNhaHang] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebsiteNhaHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebsiteNhaHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebsiteNhaHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebsiteNhaHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebsiteNhaHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebsiteNhaHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebsiteNhaHang] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WebsiteNhaHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebsiteNhaHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebsiteNhaHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebsiteNhaHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebsiteNhaHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebsiteNhaHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebsiteNhaHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebsiteNhaHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebsiteNhaHang] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WebsiteNhaHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebsiteNhaHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebsiteNhaHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebsiteNhaHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebsiteNhaHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebsiteNhaHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebsiteNhaHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebsiteNhaHang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebsiteNhaHang] SET  MULTI_USER 
GO
ALTER DATABASE [WebsiteNhaHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebsiteNhaHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebsiteNhaHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebsiteNhaHang] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WebsiteNhaHang] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WebsiteNhaHang]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 1/3/2021 21:41:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contact](
	[idContact] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
	[email] [varchar](100) NULL,
	[message] [ntext] NULL,
	[thoigiangui] [datetime] NULL,
	[tinhtrangTraloi] [bit] NULL,
	[thoigianTraloi] [datetime] NULL,
	[noidungTraloi] [ntext] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[idContact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Food]    Script Date: 1/3/2021 21:41:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[food_id] [int] IDENTITY(1,1) NOT NULL,
	[food_name] [nvarchar](200) NULL,
	[food_price] [float] NULL,
	[food_sale] [int] NULL,
	[food_avatar] [nvarchar](200) NULL,
	[food_description] [ntext] NULL,
	[foodtype_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[food_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodType]    Script Date: 1/3/2021 21:41:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodType](
	[foodtype_id] [int] IDENTITY(1,1) NOT NULL,
	[foodtype_name] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[foodtype_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Member]    Script Date: 1/3/2021 21:41:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Member](
	[member_id] [int] IDENTITY(1,1) NOT NULL,
	[member_fullname] [nvarchar](200) NULL,
	[member_phone] [varchar](16) NULL,
	[member_mail] [varchar](100) NULL,
	[member_username] [varchar](20) NULL,
	[member_password] [varchar](500) NULL,
	[member_status] [int] NULL,
	[member_type] [int] NULL,
	[member_avatar] [varchar](500) NULL,
 CONSTRAINT [PK__Member__B29B853420CAFD27] PRIMARY KEY CLUSTERED 
(
	[member_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 1/3/2021 21:41:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[orderdetail_id] [int] IDENTITY(1,1) NOT NULL,
	[foodid] [int] NULL,
	[quantity] [int] NULL,
	[ordertableid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderdetail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderTable]    Script Date: 1/3/2021 21:41:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderTable](
	[ordertable_id] [int] IDENTITY(1,1) NOT NULL,
	[ordertable_iduser] [int] NULL,
	[ordertable_dateset] [datetime] NULL,
	[ordertable_timeset] [time](7) NULL,
	[ordertable_timereturn] [time](7) NULL,
	[ordertable_idtable] [int] NULL,
	[ordertable_status] [bit] NULL,
	[tenKH] [nvarchar](200) NULL,
	[emailKH] [varchar](100) NULL,
	[dienthoaiKH] [varchar](20) NULL,
	[loaiKH] [bit] NULL,
	[loaiHD] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ordertable_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[qlTable]    Script Date: 1/3/2021 21:41:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[qlTable](
	[table_id] [int] IDENTITY(1,1) NOT NULL,
	[table_name] [varchar](10) NULL,
	[table_status] [bit] NULL,
	[table_description] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[table_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QLWeb]    Script Date: 1/3/2021 21:41:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QLWeb](
	[id_nh] [int] NULL,
	[ten_nh] [nvarchar](50) NULL,
	[diachi_nh] [nvarchar](150) NULL,
	[sdt_nh] [nvarchar](50) NULL,
	[email_nh] [nvarchar](50) NULL,
	[gt_nh] [nvarchar](4000) NULL,
	[banner_nh] [nvarchar](50) NULL,
	[anh_nh] [nvarchar](50) NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([idContact], [name], [email], [message], [thoigiangui], [tinhtrangTraloi], [thoigianTraloi], [noidungTraloi]) VALUES (2, N'huy2', N'vudinhhuyit@gmail.com', N'noidung lien he 2', CAST(N'2018-12-04 00:00:00.000' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[Contact] ([idContact], [name], [email], [message], [thoigiangui], [tinhtrangTraloi], [thoigianTraloi], [noidungTraloi]) VALUES (3, N'huy1', N'vudinhhuyit@gmail.com', N'noi dung lien he', CAST(N'2018-12-04 00:00:00.000' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[Contact] ([idContact], [name], [email], [message], [thoigiangui], [tinhtrangTraloi], [thoigianTraloi], [noidungTraloi]) VALUES (4, N'huy3', N'vudinhhuyit@gmail.com', N'noi dung lien he 3', CAST(N'2018-12-04 00:00:00.000' AS DateTime), 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([food_id], [food_name], [food_price], [food_sale], [food_avatar], [food_description], [foodtype_id]) VALUES (1, N'Nộm sứa', 20000, 5, N'offer_1.jpg', N'Nộm sứa có thể làm khai vị hay ăn kèm cơm cũng đều rất ngon, từng miếng sứa trong vắt, ...', 3)
INSERT [dbo].[Food] ([food_id], [food_name], [food_price], [food_sale], [food_avatar], [food_description], [foodtype_id]) VALUES (2, N'Ếch xào măng', 50000, 10, N'../../Assets/images/01032021_092133_PM_ech-xao-mang.jpg', N'Ếch mua nhờ làm, da xát muối nướng rồi rửa sạch, ếch chặt miếng xát muối ...', 2)
INSERT [dbo].[Food] ([food_id], [food_name], [food_price], [food_sale], [food_avatar], [food_description], [foodtype_id]) VALUES (7, N'Cút lộn xào me', 123, 12, N'../../Assets/images/01032021_093045_PM_cut-lon-xao-me.jpeg', N'Món trứng cút lộn xào me, chua chua, cay cay rất ngon và nổi tiếng. Hãy đặt món ngay.', 1)
SET IDENTITY_INSERT [dbo].[Food] OFF
SET IDENTITY_INSERT [dbo].[FoodType] ON 

INSERT [dbo].[FoodType] ([foodtype_id], [foodtype_name]) VALUES (1, N'Hai san')
INSERT [dbo].[FoodType] ([foodtype_id], [foodtype_name]) VALUES (2, N'Dac san')
INSERT [dbo].[FoodType] ([foodtype_id], [foodtype_name]) VALUES (3, N'Trang  mieng')
SET IDENTITY_INSERT [dbo].[FoodType] OFF
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([member_id], [member_fullname], [member_phone], [member_mail], [member_username], [member_password], [member_status], [member_type], [member_avatar]) VALUES (1, N' vũ huy', N'12345', N'huy@gmail.com', N'huyvu', N'202cb962ac59075b964b07152d234b70', 1, 1, N'a1.ipg')
INSERT [dbo].[Member] ([member_id], [member_fullname], [member_phone], [member_mail], [member_username], [member_password], [member_status], [member_type], [member_avatar]) VALUES (2, N' vũ huy 1', N'12345', N'dat@gmail.com', N'dat123', N'202cb962ac59075b964b07152d234b70', 1, 0, N'a2.ipg')
INSERT [dbo].[Member] ([member_id], [member_fullname], [member_phone], [member_mail], [member_username], [member_password], [member_status], [member_type], [member_avatar]) VALUES (3, N'Duwong Tien Dat', N'1932234987', N'dad@gmail.com', N'datduong', N'2e678024cabebdfe17a5aeef0163fe6d', 1, 0, N'a3.ipg')
INSERT [dbo].[Member] ([member_id], [member_fullname], [member_phone], [member_mail], [member_username], [member_password], [member_status], [member_type], [member_avatar]) VALUES (4, N'Van Trong', N'123', N'trong@gmail.com', N'admin', N'e10adc3949ba59abbe56e057f20f883e', 1, 1, N'a1.jpg')
SET IDENTITY_INSERT [dbo].[Member] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([orderdetail_id], [foodid], [quantity], [ordertableid]) VALUES (1, 2, 1, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[OrderTable] ON 

INSERT [dbo].[OrderTable] ([ordertable_id], [ordertable_iduser], [ordertable_dateset], [ordertable_timeset], [ordertable_timereturn], [ordertable_idtable], [ordertable_status], [tenKH], [emailKH], [dienthoaiKH], [loaiKH], [loaiHD]) VALUES (1, -1, CAST(N'1900-01-01 00:00:00.000' AS DateTime), CAST(N'05:30:00' AS Time), CAST(N'06:30:00' AS Time), 12, 1, N'huy', N'huy@gmail.com', N'0987654321', 0, 0)
INSERT [dbo].[OrderTable] ([ordertable_id], [ordertable_iduser], [ordertable_dateset], [ordertable_timeset], [ordertable_timereturn], [ordertable_idtable], [ordertable_status], [tenKH], [emailKH], [dienthoaiKH], [loaiKH], [loaiHD]) VALUES (3, -1, CAST(N'2018-08-04 00:00:00.000' AS DateTime), CAST(N'05:30:00' AS Time), CAST(N'05:30:00' AS Time), 10, 0, N'dsad', N'huy2@gmail.com', N'0987654321', 0, 1)
INSERT [dbo].[OrderTable] ([ordertable_id], [ordertable_iduser], [ordertable_dateset], [ordertable_timeset], [ordertable_timereturn], [ordertable_idtable], [ordertable_status], [tenKH], [emailKH], [dienthoaiKH], [loaiKH], [loaiHD]) VALUES (4, -1, CAST(N'2018-12-06 00:00:00.000' AS DateTime), CAST(N'05:30:00' AS Time), CAST(N'05:30:00' AS Time), 12, 1, N'trong', N'trong@gmail.com', N'113', 0, 1)
INSERT [dbo].[OrderTable] ([ordertable_id], [ordertable_iduser], [ordertable_dateset], [ordertable_timeset], [ordertable_timereturn], [ordertable_idtable], [ordertable_status], [tenKH], [emailKH], [dienthoaiKH], [loaiKH], [loaiHD]) VALUES (1005, -1, CAST(N'2018-12-12 00:00:00.000' AS DateTime), CAST(N'05:30:00' AS Time), CAST(N'06:30:00' AS Time), 12, 1, N'trong', N'trong@gmail.com', N'113', 0, 1)
SET IDENTITY_INSERT [dbo].[OrderTable] OFF
SET IDENTITY_INSERT [dbo].[qlTable] ON 

INSERT [dbo].[qlTable] ([table_id], [table_name], [table_status], [table_description]) VALUES (5, N'1', 0, 1)
INSERT [dbo].[qlTable] ([table_id], [table_name], [table_status], [table_description]) VALUES (6, N'2', 1, 2)
INSERT [dbo].[qlTable] ([table_id], [table_name], [table_status], [table_description]) VALUES (7, N'3', 1, 1)
INSERT [dbo].[qlTable] ([table_id], [table_name], [table_status], [table_description]) VALUES (8, N'4', 1, 1)
INSERT [dbo].[qlTable] ([table_id], [table_name], [table_status], [table_description]) VALUES (9, N'5', 1, 1)
INSERT [dbo].[qlTable] ([table_id], [table_name], [table_status], [table_description]) VALUES (12, N'8', 1, 1)
INSERT [dbo].[qlTable] ([table_id], [table_name], [table_status], [table_description]) VALUES (1012, N'ban2', 0, 3)
SET IDENTITY_INSERT [dbo].[qlTable] OFF
INSERT [dbo].[QLWeb] ([id_nh], [ten_nh], [diachi_nh], [sdt_nh], [email_nh], [gt_nh], [banner_nh], [anh_nh]) VALUES (1, N'EATWELL', N'30 Phố Nhổn ', N'0385129246', N'eatwell@gmail.com', N'Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.', N'bg_3.jpg', N'1.jpg')
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderFood_Food] FOREIGN KEY([foodid])
REFERENCES [dbo].[Food] ([food_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderFood_Food]
GO
USE [master]
GO
ALTER DATABASE [WebsiteNhaHang] SET  READ_WRITE 
GO
