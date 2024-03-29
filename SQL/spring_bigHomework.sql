USE [master]
GO
/****** Object:  Database [spring_bighomework]    Script Date: 17/05/2021 18:48:54 ******/
CREATE DATABASE [spring_bighomework]
GO
ALTER DATABASE [spring_bighomework] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [spring_bighomework].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [spring_bighomework] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [spring_bighomework] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [spring_bighomework] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [spring_bighomework] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [spring_bighomework] SET ARITHABORT OFF 
GO
ALTER DATABASE [spring_bighomework] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [spring_bighomework] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [spring_bighomework] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [spring_bighomework] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [spring_bighomework] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [spring_bighomework] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [spring_bighomework] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [spring_bighomework] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [spring_bighomework] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [spring_bighomework] SET  DISABLE_BROKER 
GO
ALTER DATABASE [spring_bighomework] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [spring_bighomework] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [spring_bighomework] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [spring_bighomework] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [spring_bighomework] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [spring_bighomework] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [spring_bighomework] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [spring_bighomework] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [spring_bighomework] SET  MULTI_USER 
GO
ALTER DATABASE [spring_bighomework] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [spring_bighomework] SET DB_CHAINING OFF 
GO
ALTER DATABASE [spring_bighomework] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [spring_bighomework] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [spring_bighomework] SET DELAYED_DURABILITY = DISABLED 
GO
USE [spring_bighomework]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 17/05/2021 18:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 17/05/2021 18:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[customerID] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](255) NULL,
	[email] [varchar](100) NULL,
	[fullName] [nvarchar](100) NULL,
	[phoneNumber] [varchar](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Images]    Script Date: 17/05/2021 18:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Images](
	[productID] [int] NOT NULL,
	[imageName] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 17/05/2021 18:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[orderID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[unitPrice] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 17/05/2021 18:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [date] NULL,
	[orderStatus] [nvarchar](100) NULL,
	[orderTotal] [int] NOT NULL,
	[ordererName] [nvarchar](100) NULL,
	[ordererPhoneNumber] [varchar](12) NULL,
	[receiverAddress] [nvarchar](100) NULL,
	[receiverName] [nvarchar](100) NULL,
	[receiverPhoneNumber] [varchar](12) NULL,
	[customerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 17/05/2021 18:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](500) NULL,
	[discontinued] [bit] NOT NULL,
	[productName] [nvarchar](255) NULL,
	[quantityInStock] [int] NOT NULL,
	[unitPrice] [int] NOT NULL,
	[categoryID] [int] NULL,
	[supplierID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 17/05/2021 18:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Suppliers](
	[supplierID] [int] IDENTITY(1,1) NOT NULL,
	[supplierEmail] [varchar](255) NULL,
	[supplierName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[supplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 17/05/2021 18:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserRoles](
	[userRoleID] [int] IDENTITY(1,1) NOT NULL,
	[role] [varchar](255) NULL,
	[userName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[userRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17/05/2021 18:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[userName] [varchar](255) NOT NULL,
	[enabled] [bit] NULL,
	[passWord] [varchar](255) NULL,
	[customerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (1, N'Áo thể thao')
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (2, N'Quần thể thao')
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (3, N'Mũ')
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (4, N'Giày thể thao')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([customerID], [address], [email], [fullName], [phoneNumber]) VALUES (1, N'Nguyễn Trường Tộ, P. Tân Thành, Q. Tân Phú, TP. HCM', N'hhhien2903@gmail.com', N'Hoàng Hữu Hiển', N'0978078705')
SET IDENTITY_INSERT [dbo].[Customers] OFF
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (1, N'adidas_ao1_1.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (1, N'adidas_ao1_2.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (1, N'adidas_ao1_3.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (2, N'adidas_ao2_1.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (2, N'adidas_ao2_2.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (3, N'adidas_quan_1.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (3, N'adidas_quan_2.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (4, N'adidas_mu_1.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (4, N'adidas_mu_2.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (5, N'adidas_giay_1.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (5, N'adidas_giay_2.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (6, N'decathlon_ao_1.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (6, N'decathlon_ao_2.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (7, N'decathlon_quan_1.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (7, N'decathlon_quan_2.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (8, N'decathlon_mu_1.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (8, N'decathlon_mu_2.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (9, N'decathlon_giay_1.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (9, N'decathlon_giay_2.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (10, N'newbalance_ao_1.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (10, N'newbalance_ao_2.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (11, N'newbalance_quan_1.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (11, N'newbalance_quan_2.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (12, N'newbalance_mu_1.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (12, N'newbalance_mu_2.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (13, N'newbalance_giay_1.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (13, N'newbalance_giay_2.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (14, N'bitis_ao_1.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (14, N'bitis_ao_2.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (15, N'bitis_mu_1.png')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (16, N'bitis_giay_1.jpg')
INSERT [dbo].[Images] ([productID], [imageName]) VALUES (16, N'bitis_giay_2.jpg')
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([productID], [description], [discontinued], [productName], [quantityInStock], [unitPrice], [categoryID], [supplierID]) VALUES (1, N'Một chiếc áo chẳng thể cứu cả hành tinh nhưng đó vẫn là bước khởi đầu. Chiếc áo chạy bộ adidas này làm từ chất liệu tái chế theo cam kết của chúng tôi hướng tới xây dựng tương lai bền vững. Chất vải thoáng khí, nhanh khô giúp bạn luôn thoải mái trong tiết trời oi bức.', 0, N'adidas RUNNING Áo thun Own the Run Cooler Nam', 9, 700000, 1, 1)
INSERT [dbo].[Products] ([productID], [description], [discontinued], [productName], [quantityInStock], [unitPrice], [categoryID], [supplierID]) VALUES (2, N'Một chiếc áo chẳng thể cứu cả hành tinh nhưng đó vẫn là bước khởi đầu. Chiếc áo chạy bộ adidas này làm từ chất liệu tái chế theo cam kết của chúng tôi hướng tới xây dựng tương lai bền vững. Chất vải thoáng khí, nhanh khô giúp bạn luôn thoải mái trong tiết trời oi bức.', 0, N'adidas GOLF Áo khoác gió Golf Core Nam Màu đen FR4245', 10, 2195000, 1, 1)
INSERT [dbo].[Products] ([productID], [description], [discontinued], [productName], [quantityInStock], [unitPrice], [categoryID], [supplierID]) VALUES (3, N'Nếu bạn cần thêm lý do để ra sân golf vào một ngày đẹp trời, chiếc quần short thể thao dệt kim dọc này của adidas cho cảm giác thoải mái và loại bỏ mọi xao lãng dưới thời tiết nóng. Dù phát bóng, tiếp cận hay gạt bóng, bạn đều có thể vận động dễ dàng và tự do cho cảm giác và cú đưa gậy theo bóng tự nhiên. Chất vải dệt kim thông thoáng giúp lưu thông khí mát.', 0, N'adidas GOLF Quần short thể thao dệt kim dọc Nam Màu đen FJ9808', 10, 2195000, 2, 1)
INSERT [dbo].[Products] ([productID], [description], [discontinued], [productName], [quantityInStock], [unitPrice], [categoryID], [supplierID]) VALUES (4, N'Duy trì sự tập trung trên sân golf trong những ngày ẩm ướt. Chiếc mũ chơi golf adidas này cho độ che chắn vượt trội suốt những vòng golf ngập nắng. Kiếm tìm cảm giác vừa vặn tuyệt đối cho riêng bạn để chinh phục 18 lỗ golf.', 0, N'Mũ adidas GOLF Performance Nam Màu đen FI3092', 46, 525000, 3, 1)
INSERT [dbo].[Products] ([productID], [description], [discontinued], [productName], [quantityInStock], [unitPrice], [categoryID], [supplierID]) VALUES (5, N'Đón chào thay đổi. Bắt đầu hành trình tập luyện mới với đôi giày chạy bộ adidas sẵn sàng cho đường chạy dài. Thân giày bằng vải dệt kim ôm chân linh hoạt, nâng đỡ tại các vị trí cần thiết mà không gây cảm giác nặng nề. Sợi vải làm từ thành phần nhựa thu gom từ các bờ biển và vùng ven biển. Đón nhận thay đổi và mở đường dẫn lối.', 0, N'adidas RUNNING Giày UltraBoost 20 Nam Màu đen FV8328', 8, 4000000, 4, 1)
INSERT [dbo].[Products] ([productID], [description], [discontinued], [productName], [quantityInStock], [unitPrice], [categoryID], [supplierID]) VALUES (6, N'Decathlon là thương hiệu đồ dùng thể thao hàng đầu Pháp với nhiều thương hiệu ngành hàng như Kalenji, Kipsta, Quechua,.... Áo chạy bộ Run Dry được sản xuất trực tiếp tại nhà máy tại Việt Nam theo tiêu chuẩn châu Âu. Sản phẩm có đầy đủ nhãn mác, nguồn gốc xuất xứ.', 0, N'Áo Thun Thể Thao Nam KALENJI Run Dry Chuyên Chạy Bộ, Nhanh Khô', 1080, 96000, 1, 2)
INSERT [dbo].[Products] ([productID], [description], [discontinued], [productName], [quantityInStock], [unitPrice], [categoryID], [supplierID]) VALUES (7, N'Decathlon là thương hiệu đồ dùng thể thao hàng đầu Pháp với nhiều thương hiệu ngành hàng như Kalenji, Kipsta, Quechua,.... Áo chạy bộ Run Dry được sản xuất trực tiếp tại nhà máy tại Việt Nam theo tiêu chuẩn châu Âu. Sản phẩm có đầy đủ nhãn mác, nguồn gốc xuất xứ.', 0, N'Quần Dài Nam KALENJI Run Dry Nhanh Khô, Có Túi Cho Chạy Bộ - Đen', 312, 375000, 2, 2)
INSERT [dbo].[Products] ([productID], [description], [discontinued], [productName], [quantityInStock], [unitPrice], [categoryID], [supplierID]) VALUES (8, N'Decathlon là thương hiệu đồ dùng thể thao hàng đầu Pháp với nhiều thương hiệu ngành hàng như Kalenji, Kipsta, Quechua,.... Áo chạy bộ Run Dry được sản xuất trực tiếp tại nhà máy tại Việt Nam theo tiêu chuẩn châu Âu. Sản phẩm có đầy đủ nhãn mác, nguồn gốc xuất xứ.', 0, N'Mũ Bơi Vải NABAIJI Không Chống Thấm Nước - Đen', 181, 39000, 3, 2)
INSERT [dbo].[Products] ([productID], [description], [discontinued], [productName], [quantityInStock], [unitPrice], [categoryID], [supplierID]) VALUES (9, N'Decathlon là thương hiệu đồ dùng thể thao hàng đầu Pháp với nhiều thương hiệu ngành hàng như Kalenji, Kipsta, Quechua,.... Áo chạy bộ Run Dry được sản xuất trực tiếp tại nhà máy tại Việt Nam theo tiêu chuẩn châu Âu. Sản phẩm có đầy đủ nhãn mác, nguồn gốc xuất xứ.', 0, N'Giày Chạy Bộ Thể Thao Nam KALENJI Run Active - Xanh lá cây', 40, 795000, 4, 2)
INSERT [dbo].[Products] ([productID], [description], [discontinued], [productName], [quantityInStock], [unitPrice], [categoryID], [supplierID]) VALUES (10, N'New Balance là một thương hiệu thời trang và giày thể thao từ Mỹ. Hơn 100 năm qua, New Balance luôn tìm hiểu nhu cầu của những vận động viên để đầu tư, thiết kế những sản phẩm phù hợp. New Balance luôn tập trung đến từng chuyển động của cơ thể con người để có thể “Tạo-Ra-Điều-Tuyệt-Vời” (Making Excellent Happen)!', 0, N'Áo thun thể thao nam NEW BALANCE - AMT03207EM1', 30, 417000, 1, 3)
INSERT [dbo].[Products] ([productID], [description], [discontinued], [productName], [quantityInStock], [unitPrice], [categoryID], [supplierID]) VALUES (11, N'New Balance là một thương hiệu thời trang và giày thể thao từ Mỹ. Hơn 100 năm qua, New Balance luôn tìm hiểu nhu cầu của những vận động viên để đầu tư, thiết kế những sản phẩm phù hợp. New Balance luôn tập trung đến từng chuyển động của cơ thể con người để có thể “Tạo-Ra-Điều-Tuyệt-Vời” (Making Excellent Happen)!', 0, N'Quần Ngắn nam NEW BALANCE - AMS01241FCB', 30, 837000, 2, 3)
INSERT [dbo].[Products] ([productID], [description], [discontinued], [productName], [quantityInStock], [unitPrice], [categoryID], [supplierID]) VALUES (12, N'New Balance là một thương hiệu thời trang và giày thể thao từ Mỹ. Hơn 100 năm qua, New Balance luôn tìm hiểu nhu cầu của những vận động viên để đầu tư, thiết kế những sản phẩm phù hợp. New Balance luôn tập trung đến từng chuyển động của cơ thể con người để có thể “Tạo-Ra-Điều-Tuyệt-Vời” (Making Excellent Happen)!', 0, N'New Balance Mũ Lưỡi Trai Phong Cách Hip Hop Cho Nam Nữ', 30, 521000, 3, 3)
INSERT [dbo].[Products] ([productID], [description], [discontinued], [productName], [quantityInStock], [unitPrice], [categoryID], [supplierID]) VALUES (13, N'New Balance là một thương hiệu thời trang và giày thể thao từ Mỹ. Hơn 100 năm qua, New Balance luôn tìm hiểu nhu cầu của những vận động viên để đầu tư, thiết kế những sản phẩm phù hợp. New Balance luôn tập trung đến từng chuyển động của cơ thể con người để có thể “Tạo-Ra-Điều-Tuyệt-Vời” (Making Excellent Happen)!', 0, N'Giày Thể Thao Nữ NEW BALANCE - WS45XRA1', 30, 948000, 4, 3)
INSERT [dbo].[Products] ([productID], [description], [discontinued], [productName], [quantityInStock], [unitPrice], [categoryID], [supplierID]) VALUES (14, N'Từ một cơ sở sản xuất nhỏ khởi nghiệp từ năm 1982 chỉ với 20 công nhân nhưng có sự quyết tâm cao độ, ý chí và luôn tự khiêm tốn để cải cách tiến lên, Bitis đã trải qua giai đoạn của nền kinh tế bao cấp với nhiều khó khăn để khẳng định vị trí của mình.', 0, N'Áo Logo Phản Quang Bitis Hunter X ACUH00100DEN', 30, 211000, 1, 4)
INSERT [dbo].[Products] ([productID], [description], [discontinued], [productName], [quantityInStock], [unitPrice], [categoryID], [supplierID]) VALUES (15, N'Từ một cơ sở sản xuất nhỏ khởi nghiệp từ năm 1982 chỉ với 20 công nhân nhưng có sự quyết tâm cao độ, ý chí và luôn tự khiêm tốn để cải cách tiến lên, Bitis đã trải qua giai đoạn của nền kinh tế bao cấp với nhiều khó khăn để khẳng định vị trí của mình.', 0, N'Mũ Bitis Hunter X Phiên Bản Giới Hạn Đặc Biệt ', 30, 690000, 3, 4)
INSERT [dbo].[Products] ([productID], [description], [discontinued], [productName], [quantityInStock], [unitPrice], [categoryID], [supplierID]) VALUES (16, N'Từ một cơ sở sản xuất nhỏ khởi nghiệp từ năm 1982 chỉ với 20 công nhân nhưng có sự quyết tâm cao độ, ý chí và luôn tự khiêm tốn để cải cách tiến lên, Bitis đã trải qua giai đoạn của nền kinh tế bao cấp với nhiều khó khăn để khẳng định vị trí của mình.', 0, N'Giày Thể Thao Cao Cấp Nam Biti’s Hunter X - Summer 2K19', 30, 999999, 4, 4)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([supplierID], [supplierEmail], [supplierName]) VALUES (1, N'business@adidas.com.vn', N'Adidas')
INSERT [dbo].[Suppliers] ([supplierID], [supplierEmail], [supplierName]) VALUES (2, N'business@decathlon.com.vn', N'Decathlon')
INSERT [dbo].[Suppliers] ([supplierID], [supplierEmail], [supplierName]) VALUES (3, N'business@newbalance.com.vn', N'New Balance')
INSERT [dbo].[Suppliers] ([supplierID], [supplierEmail], [supplierName]) VALUES (4, N'business@bitis.com.vn', N'Bitis')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([userRoleID], [role], [userName]) VALUES (2, N'ROLE_ADMIN', N'a')
INSERT [dbo].[UserRoles] ([userRoleID], [role], [userName]) VALUES (1, N'ROLE_USER', N'a')
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
INSERT [dbo].[Users] ([userName], [enabled], [passWord], [customerID]) VALUES (N'a', 1, N'$2a$10$.sI08rhwC/6Z3UrjWnssreeD5.GZl3hC/ILUX5t2fV496yvdNtTL.', 1)
SET ANSI_PADDING ON

GO
/****** Object:  Index [UKok8xfocr1c54lk1k8akw5enp7]    Script Date: 17/05/2021 18:48:54 ******/
ALTER TABLE [dbo].[UserRoles] ADD  CONSTRAINT [UKok8xfocr1c54lk1k8akw5enp7] UNIQUE NONCLUSTERED 
(
	[userName] ASC,
	[role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_pmkgkqof9rwpvef3g0b5vxi8u]    Script Date: 17/05/2021 18:48:54 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UK_pmkgkqof9rwpvef3g0b5vxi8u] UNIQUE NONCLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FKk7u5p9uew9ryn7d88kmvgmnuk] FOREIGN KEY([productID])
REFERENCES [dbo].[Products] ([productID])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FKk7u5p9uew9ryn7d88kmvgmnuk]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FKa2bup8rvw7i4k33hnaoe5rgxi] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FKa2bup8rvw7i4k33hnaoe5rgxi]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FKnns868kac97iua5ytqtdb4fja] FOREIGN KEY([productID])
REFERENCES [dbo].[Products] ([productID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FKnns868kac97iua5ytqtdb4fja]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK5r19g11701hi1ebn8vyccnml3] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customers] ([customerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK5r19g11701hi1ebn8vyccnml3]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FKbjx75exi25f1c48i92gu8rvlx] FOREIGN KEY([supplierID])
REFERENCES [dbo].[Suppliers] ([supplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FKbjx75exi25f1c48i92gu8rvlx]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FKn4dvny5ajgqgw20l5nb7imd5t] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Categories] ([categoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FKn4dvny5ajgqgw20l5nb7imd5t]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FKt762e7ty5yhdnkwiwxj6yegtk] FOREIGN KEY([userName])
REFERENCES [dbo].[Users] ([userName])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FKt762e7ty5yhdnkwiwxj6yegtk]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FKcxg1g4gic0jewxdqjr772ky2p] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customers] ([customerID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FKcxg1g4gic0jewxdqjr772ky2p]
GO
USE [master]
GO
ALTER DATABASE [spring_bighomework] SET  READ_WRITE 
GO
