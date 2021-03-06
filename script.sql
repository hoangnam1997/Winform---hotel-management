CREATE DATABASE [QuanLyKhachSan]
GO
USE [QuanLyKhachSan]
GO
/****** Object:  UserDefinedFunction [dbo].[fuConvertToUnsign1]    Script Date: 09/06/2017 3:26:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fuConvertToUnsign1] ( @strInput NVARCHAR(4000) ) RETURNS NVARCHAR(4000) AS BEGIN IF @strInput IS NULL RETURN @strInput IF @strInput = '' RETURN @strInput DECLARE @RT NVARCHAR(4000) DECLARE @SIGN_CHARS NCHAR(136) DECLARE @UNSIGN_CHARS NCHAR (136) SET @SIGN_CHARS = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệế ìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵý ĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍ ÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ' +NCHAR(272)+ NCHAR(208) SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeee iiiiiooooooooooooooouuuuuuuuuuyyyyy AADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIII OOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD' DECLARE @COUNTER int DECLARE @COUNTER1 int SET @COUNTER = 1 WHILE (@COUNTER <=LEN(@strInput)) BEGIN SET @COUNTER1 = 1 WHILE (@COUNTER1 <=LEN(@SIGN_CHARS)+1) BEGIN IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1)) = UNICODE(SUBSTRING(@strInput,@COUNTER ,1) ) BEGIN IF @COUNTER=1 SET @strInput = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)-1) ELSE SET @strInput = SUBSTRING(@strInput, 1, @COUNTER-1) +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)- @COUNTER) BREAK END SET @COUNTER1 = @COUNTER1 +1 END SET @COUNTER = @COUNTER +1 END SET @strInput = replace(@strInput,' ','-') RETURN @strInput END

GO
/****** Object:  Table [dbo].[CTPDK]    Script Date: 09/06/2017 3:26:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPDK](
	[CMND] [varchar](10) NOT NULL,
	[MAPDK] [varchar](10) NOT NULL,
	[MAP] [varchar](10) NOT NULL,
 CONSTRAINT [PK] PRIMARY KEY CLUSTERED 
(
	[CMND] ASC,
	[MAPDK] ASC,
	[MAP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTPTB]    Script Date: 09/06/2017 3:26:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPTB](
	[MALP] [varchar](10) NOT NULL,
	[MATB] [varchar](10) NOT NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_CTPTB] PRIMARY KEY CLUSTERED 
(
	[MALP] ASC,
	[MATB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CHUCVU]    Script Date: 09/06/2017 3:26:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHUCVU](
	[MACV] [varchar](10) NOT NULL,
	[TenChucVu] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[MACV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 09/06/2017 3:26:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON](
	[MAHD] [varchar](10) NOT NULL,
	[MAPDK] [varchar](10) NULL,
	[MANV] [varchar](10) NULL,
	[SoNgay] [float] NULL,
	[NgayThanhToan] [smalldatetime] NULL,
	[TongTien] [float] NULL,
	[MAP] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MAHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 09/06/2017 3:26:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[CMND] [varchar](10) NOT NULL,
	[TenKhachHang] [nvarchar](40) NULL,
	[GioiTinh] [int] NULL,
	[SoDienThoai] [varchar](12) NULL,
	[DiaChi] [nvarchar](40) NULL,
	[MAQT] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CMND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOAIPHONG]    Script Date: 09/06/2017 3:26:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAIPHONG](
	[MALP] [varchar](10) NOT NULL,
	[TenLP] [nvarchar](40) NULL,
	[Gia] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MALP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 09/06/2017 3:26:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MANV] [varchar](10) NOT NULL,
	[TenNV] [nvarchar](40) NULL,
	[GioiTinh] [int] NULL,
	[NgaySinh] [date] NULL,
	[SDT] [varchar](12) NULL,
	[DiaChi] [nvarchar](40) NULL,
	[MatKhauDangNhap] [nvarchar](200) NULL,
	[MACV] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PHIEUDANGKY]    Script Date: 09/06/2017 3:26:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUDANGKY](
	[MAPDK] [varchar](10) NOT NULL,
	[CMND] [varchar](10) NULL,
	[MANV] [varchar](10) NULL,
	[ThoiGianDen] [smalldatetime] NULL,
	[ThoiGianDi] [smalldatetime] NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MAPDK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PHONG]    Script Date: 09/06/2017 3:26:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHONG](
	[MAP] [varchar](10) NOT NULL,
	[TenPhong] [nvarchar](40) NULL,
	[TinhTrang] [int] NULL,
	[GhiChu] [nvarchar](200) NULL,
	[SoKhachToiDa] [int] NULL,
	[MALP] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MAP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QUOCTICH]    Script Date: 09/06/2017 3:26:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUOCTICH](
	[MAQT] [varchar](10) NOT NULL,
	[TenNuoc] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[MAQT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThamSo]    Script Date: 09/06/2017 3:26:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThamSo](
	[TyLePhuThuKhachThu3] [float] NULL,
	[TyLePhuThuKhachNuocNgoai] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[THIETBI]    Script Date: 09/06/2017 3:26:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THIETBI](
	[MATB] [varchar](10) NOT NULL,
	[TenTB] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[MATB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[CTPDK] ([CMND], [MAPDK], [MAP]) VALUES (N'023232323', N'SUAAIMSESS', N'P05')
INSERT [dbo].[CTPDK] ([CMND], [MAPDK], [MAP]) VALUES (N'123456019', N'PDK03', N'P03')
INSERT [dbo].[CTPDK] ([CMND], [MAPDK], [MAP]) VALUES (N'123456039', N'PDK02', N'P02')
INSERT [dbo].[CTPDK] ([CMND], [MAPDK], [MAP]) VALUES (N'123456085', N'PDK07', N'P11')
INSERT [dbo].[CTPDK] ([CMND], [MAPDK], [MAP]) VALUES (N'123456086', N'PDK06', N'P10')
INSERT [dbo].[CTPDK] ([CMND], [MAPDK], [MAP]) VALUES (N'123456087', N'PDK05', N'P06')
INSERT [dbo].[CTPDK] ([CMND], [MAPDK], [MAP]) VALUES (N'123456088', N'PDK04', N'P04')
INSERT [dbo].[CTPDK] ([CMND], [MAPDK], [MAP]) VALUES (N'123456789', N'PDK01', N'P01')
INSERT [dbo].[CTPDK] ([CMND], [MAPDK], [MAP]) VALUES (N'133344553', N'VCMKMSAKHF', N'P01')
INSERT [dbo].[CTPDK] ([CMND], [MAPDK], [MAP]) VALUES (N'148885342', N'SPPKSATBJV', N'P03')
INSERT [dbo].[CTPDK] ([CMND], [MAPDK], [MAP]) VALUES (N'15520954', N'GOQVTVDTFT', N'P13')
INSERT [dbo].[CTPDK] ([CMND], [MAPDK], [MAP]) VALUES (N'1643545334', N'SUAAIMSESS', N'P05')
INSERT [dbo].[CTPDK] ([CMND], [MAPDK], [MAP]) VALUES (N'16634344', N'SREDJCLMAJ', N'P03')
INSERT [dbo].[CTPDK] ([CMND], [MAPDK], [MAP]) VALUES (N'1834344443', N'ELCNAEBGRF', N'P19')
INSERT [dbo].[CTPDK] ([CMND], [MAPDK], [MAP]) VALUES (N'1834442524', N'JIGSGKLUCH', N'P18')
INSERT [dbo].[CTPDK] ([CMND], [MAPDK], [MAP]) VALUES (N'183867999', N'SPPKSATBJV', N'P03')
INSERT [dbo].[CTPDK] ([CMND], [MAPDK], [MAP]) VALUES (N'18434583', N'KPDEFLOALQ', N'P08')
INSERT [dbo].[CTPDK] ([CMND], [MAPDK], [MAP]) VALUES (N'198434252', N'KPDEFLOALQ', N'P08')
INSERT [dbo].[CTPTB] ([MALP], [MATB], [SoLuong]) VALUES (N'LP01', N'TB01', 1)
INSERT [dbo].[CTPTB] ([MALP], [MATB], [SoLuong]) VALUES (N'LP01', N'TB02', 3)
INSERT [dbo].[CTPTB] ([MALP], [MATB], [SoLuong]) VALUES (N'LP01', N'TB04', 4)
INSERT [dbo].[CTPTB] ([MALP], [MATB], [SoLuong]) VALUES (N'LP01', N'TB07', 5)
INSERT [dbo].[CTPTB] ([MALP], [MATB], [SoLuong]) VALUES (N'LP02', N'TB01', 2)
INSERT [dbo].[CTPTB] ([MALP], [MATB], [SoLuong]) VALUES (N'LP02', N'TB02', 2)
INSERT [dbo].[CTPTB] ([MALP], [MATB], [SoLuong]) VALUES (N'LP02', N'TB03', 2)
INSERT [dbo].[CTPTB] ([MALP], [MATB], [SoLuong]) VALUES (N'LP02', N'TB04', 2)
INSERT [dbo].[CTPTB] ([MALP], [MATB], [SoLuong]) VALUES (N'LP03', N'TB01', 3)
INSERT [dbo].[CTPTB] ([MALP], [MATB], [SoLuong]) VALUES (N'LP03', N'TB03', 3)
INSERT [dbo].[CTPTB] ([MALP], [MATB], [SoLuong]) VALUES (N'LP03', N'TB05', 3)
INSERT [dbo].[CTPTB] ([MALP], [MATB], [SoLuong]) VALUES (N'LP03', N'TB06', 3)
INSERT [dbo].[CTPTB] ([MALP], [MATB], [SoLuong]) VALUES (N'LP03', N'TB07', 3)
INSERT [dbo].[CHUCVU] ([MACV], [TenChucVu]) VALUES (N'ADMIN', N'Toàn quyền')
INSERT [dbo].[CHUCVU] ([MACV], [TenChucVu]) VALUES (N'NHANVIEN', N'Nhân viên')
INSERT [dbo].[HOADON] ([MAHD], [MAPDK], [MANV], [SoNgay], [NgayThanhToan], [TongTien], [MAP]) VALUES (N'AIGGLJBCET', N'KPDEFLOALQ', N'ADMIN', 0.0037193798182870367, CAST(N'2017-06-05T18:54:00' AS SmallDateTime), 743.8759636574074, N'P08')
INSERT [dbo].[HOADON] ([MAHD], [MAPDK], [MANV], [SoNgay], [NgayThanhToan], [TongTien], [MAP]) VALUES (N'BFSABQLCRS', N'PDK01', N'ADMIN', 0.011482057555555555, CAST(N'2017-06-05T11:39:00' AS SmallDateTime), 1722.3086333333333, N'P01')
INSERT [dbo].[HOADON] ([MAHD], [MAPDK], [MANV], [SoNgay], [NgayThanhToan], [TongTien], [MAP]) VALUES (N'CSFVCTAGBP', N'PDK02', N'ADMIN', 24.965728282803241, CAST(N'2017-06-30T10:52:00' AS SmallDateTime), 3744859.2424204862, N'P02')
INSERT [dbo].[HOADON] ([MAHD], [MAPDK], [MANV], [SoNgay], [NgayThanhToan], [TongTien], [MAP]) VALUES (N'GPBMBJQMOJ', N'SPPKSATBJV', N'ADMIN', 24.671407014572917, CAST(N'2017-06-30T10:52:00' AS SmallDateTime), 3700711.0521859378, N'P03')
INSERT [dbo].[HOADON] ([MAHD], [MAPDK], [MANV], [SoNgay], [NgayThanhToan], [TongTien], [MAP]) VALUES (N'VJURSGNMGS', N'ELCNAEBGRF', N'ADMIN', 0.00033892860763888886, CAST(N'2017-06-09T15:15:00' AS SmallDateTime), 86.426794947916662, N'P19')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'023232323', N'Mai Phương Lan', 0, N'095331244', N'Cà Mau', N'Vi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'123126781', N'Phùng Nguyễn Mạnh Khương', 0, N'0143456789', N'TPHCM', N'Vi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'12344444', N'Trần Duy Hưng', 1, N'0992435637', N'Cần Thơ', N'Vi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'123456019', N'Trần Vĩnh Phúc', 0, N'0163122123', N'Cần Thơ', N'Vi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'123456029', N'Nguyễn Thành Nhân', 1, N'093143123', N'Bà Rịa', N'Vi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'123456039', N'Trần Hữu Toàn', 1, N'0164323123', N'Lâm Đồng', N'Vi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'123456083', N'Từ Vĩnh Nguyên', 1, N'012323123', N'Hà Nội', N'KhacVi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'123456084', N'Nguyễn Hào Quang', 1, N'0164523923', N'Đà Nẵng', N'KhacVi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'123456085', N'Phan Thanh Duy', 1, N'09923833', N'Phú Yên', N'KhacVi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'123456086', N'Nguyễn Duy Cẩn', 1, N'013163123', N'Nam Định', N'KhacVi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'123456087', N'Phan Minh Tuấn', 1, N'0163122123', N'Kiên Giang', N'KhacVi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'123456088', N'Nguyễn Thành Nhân', 0, N'093124123', N'Đồng Tháp', N'Vi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'123456789', N'Nguyễn Duy Hiếu', 1, N'0923456789', N'TPHCM', N'Vi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'123656782', N'Nguyễn Cao Minh', 0, N'093456789', N'TPHCM', N'Vi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'133344553', N'Nguyễn Văn Tân', 1, N'019334444', N'Hà Nội', N'Vi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'1347348373', N'Nguyễn Thị Huyền', 1, N'01233434325', N'TP Hồ Chí Minh', N'Vi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'1443434634', N'Kiều Trà My', 0, N'0999555333', N'Đà Nẵng', N'Vi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'145424288', N'Trần Trung Quân', 1, N'0166777555', N'Hà Nội', N'Vi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'148885342', N'Nguyễn Thị Hồng', 0, N'095335322', N'Hà Tĩnh', N'Vi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'15520954', N'Đặng Hùng Nam', 1, N'0349343434', N'Bắc Giang', N'Vi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'1643545334', N'Lê Văn Vinh', 1, N'093434433', N'TP Hồ Chí Minh', N'Vi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'16634344', N'Phan Thị Nhung', 0, N'3434434444', N'Tây Ninh', N'Vi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'1834344443', N'Nguyễn Văn Hùng', 1, N'183839384384', N'Hà Nội', N'KhacVi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'183442524', N'', 1, N'', N'', N'KhacVi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'1834442524', N'Bùi Thị Nguyệt', 0, N'18002323', N'Hà Nội', N'Vi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'183867999', N'Phan Huy Nam', 1, N'01668955833', N'Hà Tĩnh', N'Vi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'18434583', N'Trần Hoài Nam', 1, N'085332222', N'Đà Nẵng', N'Vi')
INSERT [dbo].[KHACHHANG] ([CMND], [TenKhachHang], [GioiTinh], [SoDienThoai], [DiaChi], [MAQT]) VALUES (N'198434252', N'Nguyễn Huyền My', 0, N'0984435353', N'Vĩnh Long', N'Vi')
INSERT [dbo].[LOAIPHONG] ([MALP], [TenLP], [Gia]) VALUES (N'LP01', N'Loai 1', 150000)
INSERT [dbo].[LOAIPHONG] ([MALP], [TenLP], [Gia]) VALUES (N'LP02', N'Loai 2', 170000)
INSERT [dbo].[LOAIPHONG] ([MALP], [TenLP], [Gia]) VALUES (N'LP03', N'Loai 3', 200000)
INSERT [dbo].[NHANVIEN] ([MANV], [TenNV], [GioiTinh], [NgaySinh], [SDT], [DiaChi], [MatKhauDangNhap], [MACV]) VALUES (N'ADMIN', N'ADMIN', 1, CAST(N'1997-11-07' AS Date), N'0981471595', N'Long An', N'1962026656160185351301320480154111117132155', N'ADMIN')
INSERT [dbo].[NHANVIEN] ([MANV], [TenNV], [GioiTinh], [NgaySinh], [SDT], [DiaChi], [MatKhauDangNhap], [MACV]) VALUES (N'NHANVIEN01', N'Nhân Viên Lễ tân', 0, CAST(N'1999-12-07' AS Date), N'093452754', N'Cần Thơ', N'1962026656160185351301320480154111117132155', N'NHANVIEN')
INSERT [dbo].[NHANVIEN] ([MANV], [TenNV], [GioiTinh], [NgaySinh], [SDT], [DiaChi], [MatKhauDangNhap], [MACV]) VALUES (N'NHANVIEN02', N'Nhân Viên Lễ tân', 0, CAST(N'2000-01-03' AS Date), N'0163744635', N'Campuchia', N'1962026656160185351301320480154111117132155', N'NHANVIEN')
INSERT [dbo].[NHANVIEN] ([MANV], [TenNV], [GioiTinh], [NgaySinh], [SDT], [DiaChi], [MatKhauDangNhap], [MACV]) VALUES (N'NHANVIEN03', N'Nhân viên kế toán', 0, CAST(N'1997-01-03' AS Date), N'0163763737', N'TP Hồ Chí Minh', N'1962026656160185351301320480154111117132155', N'NHANVIEN')
INSERT [dbo].[PHIEUDANGKY] ([MAPDK], [CMND], [MANV], [ThoiGianDen], [ThoiGianDi], [TrangThai]) VALUES (N'ELCNAEBGRF', N'1834344443', N'ADMIN', CAST(N'2017-06-09T15:14:00' AS SmallDateTime), CAST(N'2017-06-09T15:15:00' AS SmallDateTime), 1)
INSERT [dbo].[PHIEUDANGKY] ([MAPDK], [CMND], [MANV], [ThoiGianDen], [ThoiGianDi], [TrangThai]) VALUES (N'GOQVTVDTFT', N'15520954', N'ADMIN', CAST(N'2017-06-10T15:15:00' AS SmallDateTime), CAST(N'2017-06-15T15:15:00' AS SmallDateTime), 0)
INSERT [dbo].[PHIEUDANGKY] ([MAPDK], [CMND], [MANV], [ThoiGianDen], [ThoiGianDi], [TrangThai]) VALUES (N'JIGSGKLUCH', N'183442524', N'ADMIN', CAST(N'2017-06-09T15:17:00' AS SmallDateTime), CAST(N'2017-06-09T15:17:00' AS SmallDateTime), 0)
INSERT [dbo].[PHIEUDANGKY] ([MAPDK], [CMND], [MANV], [ThoiGianDen], [ThoiGianDi], [TrangThai]) VALUES (N'KPDEFLOALQ', N'18434583', N'ADMIN', CAST(N'2017-06-05T18:49:00' AS SmallDateTime), CAST(N'2017-06-05T18:54:00' AS SmallDateTime), 1)
INSERT [dbo].[PHIEUDANGKY] ([MAPDK], [CMND], [MANV], [ThoiGianDen], [ThoiGianDi], [TrangThai]) VALUES (N'PDK01', N'123456789', N'NHANVIEN01', CAST(N'2017-06-05T11:22:00' AS SmallDateTime), CAST(N'2017-06-05T11:39:00' AS SmallDateTime), 1)
INSERT [dbo].[PHIEUDANGKY] ([MAPDK], [CMND], [MANV], [ThoiGianDen], [ThoiGianDi], [TrangThai]) VALUES (N'PDK02', N'123456789', N'NHANVIEN01', CAST(N'2017-06-05T11:41:00' AS SmallDateTime), CAST(N'2017-06-30T10:52:00' AS SmallDateTime), 1)
INSERT [dbo].[PHIEUDANGKY] ([MAPDK], [CMND], [MANV], [ThoiGianDen], [ThoiGianDi], [TrangThai]) VALUES (N'PDK03', N'123456789', N'NHANVIEN02', CAST(N'2017-07-07T00:00:00' AS SmallDateTime), CAST(N'2017-07-17T00:00:00' AS SmallDateTime), 0)
INSERT [dbo].[PHIEUDANGKY] ([MAPDK], [CMND], [MANV], [ThoiGianDen], [ThoiGianDi], [TrangThai]) VALUES (N'PDK04', N'123456789', N'NHANVIEN02', CAST(N'2017-08-07T00:00:00' AS SmallDateTime), CAST(N'2017-08-16T00:00:00' AS SmallDateTime), 0)
INSERT [dbo].[PHIEUDANGKY] ([MAPDK], [CMND], [MANV], [ThoiGianDen], [ThoiGianDi], [TrangThai]) VALUES (N'PDK05', N'123456789', N'NHANVIEN02', CAST(N'2017-09-07T00:00:00' AS SmallDateTime), CAST(N'2017-10-15T00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[PHIEUDANGKY] ([MAPDK], [CMND], [MANV], [ThoiGianDen], [ThoiGianDi], [TrangThai]) VALUES (N'PDK06', N'123456789', N'NHANVIEN01', CAST(N'2017-10-07T00:00:00' AS SmallDateTime), CAST(N'2017-10-23T00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[PHIEUDANGKY] ([MAPDK], [CMND], [MANV], [ThoiGianDen], [ThoiGianDi], [TrangThai]) VALUES (N'PDK07', N'123456789', N'NHANVIEN01', CAST(N'2017-11-07T00:00:00' AS SmallDateTime), CAST(N'2017-12-12T00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[PHIEUDANGKY] ([MAPDK], [CMND], [MANV], [ThoiGianDen], [ThoiGianDi], [TrangThai]) VALUES (N'PDK08', N'123456789', N'NHANVIEN01', CAST(N'2017-12-07T00:00:00' AS SmallDateTime), CAST(N'2017-12-22T00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[PHIEUDANGKY] ([MAPDK], [CMND], [MANV], [ThoiGianDen], [ThoiGianDi], [TrangThai]) VALUES (N'SPPKSATBJV', N'183867999', N'ADMIN', CAST(N'2017-06-05T18:45:00' AS SmallDateTime), CAST(N'2017-06-30T10:52:00' AS SmallDateTime), 1)
INSERT [dbo].[PHIEUDANGKY] ([MAPDK], [CMND], [MANV], [ThoiGianDen], [ThoiGianDi], [TrangThai]) VALUES (N'SREDJCLMAJ', N'16634344', N'ADMIN', CAST(N'2017-08-01T15:22:00' AS SmallDateTime), CAST(N'2017-08-02T15:22:00' AS SmallDateTime), 0)
INSERT [dbo].[PHIEUDANGKY] ([MAPDK], [CMND], [MANV], [ThoiGianDen], [ThoiGianDi], [TrangThai]) VALUES (N'SUAAIMSESS', N'023232323', N'ADMIN', CAST(N'2017-06-09T11:10:00' AS SmallDateTime), CAST(N'2017-06-10T10:56:00' AS SmallDateTime), 1)
INSERT [dbo].[PHIEUDANGKY] ([MAPDK], [CMND], [MANV], [ThoiGianDen], [ThoiGianDi], [TrangThai]) VALUES (N'VCMKMSAKHF', N'133344553', N'ADMIN', CAST(N'2017-06-09T10:56:00' AS SmallDateTime), CAST(N'2017-06-11T10:53:00' AS SmallDateTime), 1)
INSERT [dbo].[PHONG] ([MAP], [TenPhong], [TinhTrang], [GhiChu], [SoKhachToiDa], [MALP]) VALUES (N'P01', N'Phòng 01', 1, N'Phòng 01', 3, N'LP01')
INSERT [dbo].[PHONG] ([MAP], [TenPhong], [TinhTrang], [GhiChu], [SoKhachToiDa], [MALP]) VALUES (N'P02', N'Phòng 02', 0, N'Phòng 02', 3, N'LP01')
INSERT [dbo].[PHONG] ([MAP], [TenPhong], [TinhTrang], [GhiChu], [SoKhachToiDa], [MALP]) VALUES (N'P03', N'Phòng 03', 0, N'Phòng 03', 3, N'LP01')
INSERT [dbo].[PHONG] ([MAP], [TenPhong], [TinhTrang], [GhiChu], [SoKhachToiDa], [MALP]) VALUES (N'P04', N'Phòng 04', 0, N'Phòng 04', 3, N'LP01')
INSERT [dbo].[PHONG] ([MAP], [TenPhong], [TinhTrang], [GhiChu], [SoKhachToiDa], [MALP]) VALUES (N'P05', N'Phòng 05', 1, N'Phòng 05', 3, N'LP02')
INSERT [dbo].[PHONG] ([MAP], [TenPhong], [TinhTrang], [GhiChu], [SoKhachToiDa], [MALP]) VALUES (N'P06', N'Phòng 06', 0, N'Phòng 06', 3, N'LP02')
INSERT [dbo].[PHONG] ([MAP], [TenPhong], [TinhTrang], [GhiChu], [SoKhachToiDa], [MALP]) VALUES (N'P08', N'Phòng 08', 0, N'Phòng 08', 3, N'LP03')
INSERT [dbo].[PHONG] ([MAP], [TenPhong], [TinhTrang], [GhiChu], [SoKhachToiDa], [MALP]) VALUES (N'P09', N'Phòng 09', 0, N'Phòng 09', 3, N'LP03')
INSERT [dbo].[PHONG] ([MAP], [TenPhong], [TinhTrang], [GhiChu], [SoKhachToiDa], [MALP]) VALUES (N'P10', N'Phòng 10', 0, N'Phòng 10', 3, N'LP03')
INSERT [dbo].[PHONG] ([MAP], [TenPhong], [TinhTrang], [GhiChu], [SoKhachToiDa], [MALP]) VALUES (N'P11', N'Phòng 11', 0, N'Phòng 11', 3, N'LP01')
INSERT [dbo].[PHONG] ([MAP], [TenPhong], [TinhTrang], [GhiChu], [SoKhachToiDa], [MALP]) VALUES (N'P12', N'Phòng 12', 0, N'Phòng 12', 3, N'LP01')
INSERT [dbo].[PHONG] ([MAP], [TenPhong], [TinhTrang], [GhiChu], [SoKhachToiDa], [MALP]) VALUES (N'P13', N'Phòng 13', 0, N'Phòng 13', 3, N'LP02')
INSERT [dbo].[PHONG] ([MAP], [TenPhong], [TinhTrang], [GhiChu], [SoKhachToiDa], [MALP]) VALUES (N'P14', N'Phòng 14', 0, N'Phòng 14', 3, N'LP02')
INSERT [dbo].[PHONG] ([MAP], [TenPhong], [TinhTrang], [GhiChu], [SoKhachToiDa], [MALP]) VALUES (N'P15', N'Phòng 15', 0, N'Phòng 15', 3, N'LP03')
INSERT [dbo].[PHONG] ([MAP], [TenPhong], [TinhTrang], [GhiChu], [SoKhachToiDa], [MALP]) VALUES (N'P16', N'Phòng 16', 0, N'Phòng 16', 3, N'LP03')
INSERT [dbo].[PHONG] ([MAP], [TenPhong], [TinhTrang], [GhiChu], [SoKhachToiDa], [MALP]) VALUES (N'P17', N'Phòng 17', 0, N'Phòng 17', 3, N'LP01')
INSERT [dbo].[PHONG] ([MAP], [TenPhong], [TinhTrang], [GhiChu], [SoKhachToiDa], [MALP]) VALUES (N'P18', N'Phòng 18', 0, N'Phòng 18', 3, N'LP01')
INSERT [dbo].[PHONG] ([MAP], [TenPhong], [TinhTrang], [GhiChu], [SoKhachToiDa], [MALP]) VALUES (N'P19', N'Phòng 19', 0, N'Phòng 19', 3, N'LP02')
INSERT [dbo].[PHONG] ([MAP], [TenPhong], [TinhTrang], [GhiChu], [SoKhachToiDa], [MALP]) VALUES (N'P20', N'Phòng 20', 0, N'Phòng 20', 3, N'LP02')
INSERT [dbo].[QUOCTICH] ([MAQT], [TenNuoc]) VALUES (N'KhacVi', N'Các nước còn lại')
INSERT [dbo].[QUOCTICH] ([MAQT], [TenNuoc]) VALUES (N'Vi', N'Việt Nam')
INSERT [dbo].[ThamSo] ([TyLePhuThuKhachThu3], [TyLePhuThuKhachNuocNgoai]) VALUES (25, 1.5)
INSERT [dbo].[THIETBI] ([MATB], [TenTB]) VALUES (N'TB01', N'Giường')
INSERT [dbo].[THIETBI] ([MATB], [TenTB]) VALUES (N'TB02', N'Gương')
INSERT [dbo].[THIETBI] ([MATB], [TenTB]) VALUES (N'TB03', N'Rèm')
INSERT [dbo].[THIETBI] ([MATB], [TenTB]) VALUES (N'TB04', N'Ghế')
INSERT [dbo].[THIETBI] ([MATB], [TenTB]) VALUES (N'TB05', N'Máy lạnh')
INSERT [dbo].[THIETBI] ([MATB], [TenTB]) VALUES (N'TB06', N'Tivi')
INSERT [dbo].[THIETBI] ([MATB], [TenTB]) VALUES (N'TB07', N'Quạt')
ALTER TABLE [dbo].[CTPDK]  WITH CHECK ADD FOREIGN KEY([CMND])
REFERENCES [dbo].[KHACHHANG] ([CMND])
GO
ALTER TABLE [dbo].[CTPDK]  WITH CHECK ADD FOREIGN KEY([MAP])
REFERENCES [dbo].[PHONG] ([MAP])
GO
ALTER TABLE [dbo].[CTPDK]  WITH CHECK ADD FOREIGN KEY([MAPDK])
REFERENCES [dbo].[PHIEUDANGKY] ([MAPDK])
GO
ALTER TABLE [dbo].[CTPTB]  WITH CHECK ADD FOREIGN KEY([MALP])
REFERENCES [dbo].[LOAIPHONG] ([MALP])
GO
ALTER TABLE [dbo].[CTPTB]  WITH CHECK ADD FOREIGN KEY([MATB])
REFERENCES [dbo].[THIETBI] ([MATB])
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD FOREIGN KEY([MANV])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD FOREIGN KEY([MAP])
REFERENCES [dbo].[PHONG] ([MAP])
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD FOREIGN KEY([MAPDK])
REFERENCES [dbo].[PHIEUDANGKY] ([MAPDK])
GO
ALTER TABLE [dbo].[KHACHHANG]  WITH CHECK ADD FOREIGN KEY([MAQT])
REFERENCES [dbo].[QUOCTICH] ([MAQT])
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD FOREIGN KEY([MACV])
REFERENCES [dbo].[CHUCVU] ([MACV])
GO
ALTER TABLE [dbo].[PHIEUDANGKY]  WITH CHECK ADD FOREIGN KEY([CMND])
REFERENCES [dbo].[KHACHHANG] ([CMND])
GO
ALTER TABLE [dbo].[PHIEUDANGKY]  WITH CHECK ADD FOREIGN KEY([MANV])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[PHONG]  WITH CHECK ADD FOREIGN KEY([MALP])
REFERENCES [dbo].[LOAIPHONG] ([MALP])
GO
ALTER TABLE [dbo].[CTPTB]  WITH CHECK ADD CHECK  (([SoLuong]>=(0)))
GO
ALTER TABLE [dbo].[KHACHHANG]  WITH CHECK ADD CHECK  (((1)>=[GioiTinh] AND [GioiTinh]>=(0)))
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD CHECK  (([GioiTinh]>=(0) AND [GioiTinh]<=(1)))
GO
ALTER TABLE [dbo].[PHIEUDANGKY]  WITH CHECK ADD CHECK  (([TrangThai]>=(0) AND [TrangThai]<=(1)))
GO
ALTER TABLE [dbo].[PHONG]  WITH CHECK ADD CHECK  (([SoKhachToiDa]>=(0)))
GO
ALTER TABLE [dbo].[PHONG]  WITH CHECK ADD CHECK  (([TinhTrang]>=(0) AND [TinhTrang]<=(1)))
GO
/****** Object:  StoredProcedure [dbo].[USP_deleteCTPDKbyMAPDKvaMAP]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_deleteCTPDKbyMAPDKvaMAP]
@MAPDK VARCHAR(10),@MAP VARCHAR(10)
AS
BEGIN
	DELETE dbo.CTPDK WHERE   MAPDK=@MAPDK AND MAP=@MAP
END

GO
/****** Object:  StoredProcedure [dbo].[USP_deleteCTPTBtheoMALP]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_deleteCTPTBtheoMALP]
@MALP VARCHAR(10)
AS
BEGIN
	DELETE dbo.CTPTB WHERE MALP=@MALP
END

GO
/****** Object:  StoredProcedure [dbo].[USP_deleteKhachHang]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_deleteKhachHang]
@cmnd VARCHAR(10)
AS
BEGIN
	DELETE dbo.CTPDK WHERE CMND=@cmnd
	DELETE dbo.PHIEUDANGKY WHERE CMND=@cmnd
	DELETE dbo.KHACHHANG WHERE CMND=@cmnd
END

GO
/****** Object:  StoredProcedure [dbo].[USP_deleteLoaiPhong]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_deleteLoaiPhong]
@MALP VARCHAR(10)
AS
BEGIN
	SELECT MAPDK INTO tempMAPDK FROM  dbo.CTPDK WHERE MAP IN(SELECT MAP FROM dbo.PHONG WHERE MALP=@MALP)
	SELECT MAP INTO tempMAP FROM dbo.PHONG WHERE MALP = @MALP
	DELETE dbo.CTPDK WHERE MAPDK IN (SELECT MAPDK FROM tempMAPDK)
	DELETE dbo.PHIEUDANGKY WHERE MAPDK IN (SELECT MAPDK FROM tempMAPDK)
	DELETE dbo.HOADON WHERE MAP IN (SELECT MAP FROM tempMAP)
	DELETE dbo.CTPTB WHERE MALP=@MALP
	DELETE dbo.PHONG WHERE MALP=@MALP
	DELETE dbo.LOAIPHONG WHERE MALP=@MALP
	DROP TABLE tempMAPDK
	DROP TABLE tempMAP
    
END

GO
/****** Object:  StoredProcedure [dbo].[USP_deleteNhanVien]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_deleteNhanVien]
@manv VARCHAR(10)
AS
BEGIN
	SELECT MAPDK INTO temp FROM dbo.PHIEUDANGKY WHERE MANV=@manv
	DELETE dbo.CTPDK WHERE MAPDK IN (SELECT MAPDK FROM temp)
	DELETE dbo.PHIEUDANGKY WHERE MANV=@manv
	DELETE dbo.HOADON WHERE MANV=@manv
	DELETE dbo.NHANVIEN WHERE MANV=@manv
	DROP TABLE temp
END

GO
/****** Object:  StoredProcedure [dbo].[USP_deletePhieuDangKy]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_deletePhieuDangKy]
@MAPDK VARCHAR(10)
AS
BEGIN
	DELETE dbo.CTPDK WHERE MAPDK=@MAPDK
	DELETE dbo.HOADON WHERE MAPDK=@MAPDK
	DELETE dbo.PHIEUDANGKY WHERE MAPDK=@MAPDK
END

GO
/****** Object:  StoredProcedure [dbo].[USP_deletePhong]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_deletePhong]
@MAP VARCHAR(10)
AS
BEGIN
	DELETE dbo.CTPDK WHERE MAP=@MAP
	DELETE dbo.HOADON WHERE MAP=@MAP
	DELETE dbo.PHONG WHERE MAP=@MAP
END

GO
/****** Object:  StoredProcedure [dbo].[USP_deleteQucTich]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_deleteQucTich]
@MAQT VARCHAR(10)
AS
BEGIN
	DELETE dbo.KHACHHANG WHERE MAQT=@MAQT
	DELETE dbo.QUOCTICH WHERE MAQT=@MAQT
END

GO
/****** Object:  StoredProcedure [dbo].[USP_deleteThietBi]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_deleteThietBi]
@MATB VARCHAR(10)
AS
BEGIN
	DELETE dbo.CTPTB WHERE MATB=@MATB
	DELETE dbo.THIETBI WHERE MATB=@MATB
END

GO
/****** Object:  StoredProcedure [dbo].[USP_getDanhSachPhongTheoHoaDon]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROC	[dbo].[USP_getDanhSachPhongTheoHoaDon]
@MADK VARCHAR(10)
AS
BEGIN
	SELECT *FROM dbo.PHONG WHERE MAP IN (SELECT MAP FROM dbo.CTPDK WHERE MAPDK=@MADK)
END

GO
/****** Object:  StoredProcedure [dbo].[USP_getKhachHangbyMAKH]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_getKhachHangbyMAKH]
@MAKH VARCHAR(10)
AS
BEGIN
	SELECT *FROM dbo.KHACHHANG WHERE CMND=@MAKH
END

GO
/****** Object:  StoredProcedure [dbo].[USP_getListCTPDKbyMAPandMAPDK]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_getListCTPDKbyMAPandMAPDK]
@MAP VARCHAR(10), @mapdk VARCHAR(10)
AS
BEGIN
	SELECT * FROM dbo.CTPDK WHERE MAPDK =@mapdk AND MAP = @MAP
END

GO
/****** Object:  StoredProcedure [dbo].[USP_getListCTPTBbyMALP]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_getListCTPTBbyMALP]
@MALP VARCHAR(10)
AS
BEGIN
SELECT *FROM dbo.CTPTB JOIN dbo.THIETBI ON THIETBI.MATB = CTPTB.MATB WHERE MALP=@MALP
END

GO
/****** Object:  StoredProcedure [dbo].[USP_getListHoaDonKhoanThoiGian]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_getListHoaDonKhoanThoiGian]
@tuNgay SMALLDATETIME, @denNgay SMALLDATETIME
AS
BEGIN
	SELECT *FROM dbo.HOADON WHERE NgayThanhToan<=@denNgay AND NgayThanhToan>=@tuNgay
END

GO
/****** Object:  StoredProcedure [dbo].[USP_getListKhachHang]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_getListKhachHang]
AS
BEGIN
	SELECT *FROM dbo.KHACHHANG
END

GO
/****** Object:  StoredProcedure [dbo].[USP_getListLoaiPhong]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_getListLoaiPhong]
AS
BEGIN
SELECT *FROM dbo.LOAIPHONG
END

GO
/****** Object:  StoredProcedure [dbo].[USP_getListLoaiPhongTheoTen]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_getListLoaiPhongTheoTen]
@Ten NVARCHAR(40)
AS
BEGIN
DECLARE @Tennew NVARCHAR(40) = '%'+dbo.fuConvertToUnsign1(@Ten)+'%'
SELECT *FROM dbo.LOAIPHONG WHERE dbo.fuConvertToUnsign1(TenLP) LIKE @Tennew
END

GO
/****** Object:  StoredProcedure [dbo].[USP_getListNhanVien]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_getListNhanVien]
AS
BEGIN
	SELECT *FROM dbo.NHANVIEN
END

GO
/****** Object:  StoredProcedure [dbo].[USP_getListNhanVientheoTen]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_getListNhanVientheoTen]
@TenNV NVARCHAR(40)
AS
BEGIN
	DECLARE @Ten NVARCHAR(40) = '%'+dbo.fuConvertToUnsign1(@TenNV)+'%'
	SELECT *FROM dbo.NHANVIEN WHERE dbo.fuConvertToUnsign1(TenNV) LIKE @Ten
END

GO
/****** Object:  StoredProcedure [dbo].[USP_getListPhieuDangKyChuaDenbyMAP]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_getListPhieuDangKyChuaDenbyMAP]
@map VARCHAR(10)
AS
BEGIN
	SELECT *FROM dbo.PHIEUDANGKY WHERE TrangThai = 0 AND MAPDK IN (SELECT MAPDK FROM dbo.CTPDK WHERE MAP=@map)
END

GO
/****** Object:  StoredProcedure [dbo].[USP_getListPhieuDangKyDaDenbyMAP]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_getListPhieuDangKyDaDenbyMAP]
@map VARCHAR(10)
AS
BEGIN
	SELECT *FROM dbo.PHIEUDANGKY WHERE TrangThai = 1 AND MAPDK IN (SELECT MAPDK FROM dbo.CTPDK WHERE MAP=@map) AND MAPDK NOT IN (SELECT MAPDK FROM dbo.HOADON WHERE  MAP=@map)
END

GO
/****** Object:  StoredProcedure [dbo].[USP_getListPhong]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_getListPhong]
AS
BEGIN
SELECT *FROM dbo.PHONG
END

GO
/****** Object:  StoredProcedure [dbo].[USP_getListPhongbyMALPvsTrangThai]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_getListPhongbyMALPvsTrangThai]
@malp VARCHAR(10),@TrangThai INT
AS
BEGIN
	IF(@TrangThai=-1)
	BEGIN
		SELECT *FROM dbo.PHONG WHERE MALP=@malp
    END
    ELSE
    BEGIN
		SELECT *FROM dbo.PHONG WHERE MALP=@malp AND TinhTrang = @TrangThai
    END  
END

GO
/****** Object:  StoredProcedure [dbo].[USP_getListPhongbyMAP]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_getListPhongbyMAP]
@maP VARCHAR(10)
AS
BEGIN
SELECT *FROM dbo.PHONG WHERE MAP=@maP
END

GO
/****** Object:  StoredProcedure [dbo].[USP_getListQuocTich]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_getListQuocTich]
AS
BEGIN
	SELECT *FROM dbo.QUOCTICH
END

GO
/****** Object:  StoredProcedure [dbo].[USP_getListQuocTichtheoTen]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_getListQuocTichtheoTen]
@Ten NVARCHAR(40)
AS
BEGIN
	DECLARE @TenNuoc NVARCHAR(40)= '%'+dbo.fuConvertToUnsign1(@Ten) + '%'
	SELECT *FROM dbo.QUOCTICH WHERE dbo.fuConvertToUnsign1(TenNuoc) LIKE @TenNuoc
END

GO
/****** Object:  StoredProcedure [dbo].[USP_getLoaiPhongbyMALP]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_getLoaiPhongbyMALP]
@MALP VARCHAR(10)
AS
BEGIN
SELECT *FROM dbo.LOAIPHONG WHERE MALP =@MALP
END

GO
/****** Object:  StoredProcedure [dbo].[USP_getNhanVienbyMANV]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_getNhanVienbyMANV]
@manv VARCHAR(10)
AS
BEGIN
	SELECT *FROM dbo.NHANVIEN WHERE MANV=@manv
END

GO
/****** Object:  StoredProcedure [dbo].[USP_getThamSo]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_getThamSo]
AS
BEGIN
SELECT *FROM dbo.ThamSo
END

GO
/****** Object:  StoredProcedure [dbo].[USP_getThongTinHoaDon]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_getThongTinHoaDon]
@MAHD VARCHAR(10)
AS
BEGIN
	SELECT MAHD,HOADON.MANV,TenKhachHang,SoNgay,MAP,NgayThanhToan,TongTien
	FROM dbo.HOADON JOIN dbo.PHIEUDANGKY ON PHIEUDANGKY.MAPDK = HOADON.MAPDK JOIN dbo.KHACHHANG ON KHACHHANG.CMND = PHIEUDANGKY.CMND
	WHERE MAHD = @MAHD
END

GO
/****** Object:  StoredProcedure [dbo].[USP_getThongTinHoaDonThoiGian]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_getThongTinHoaDonThoiGian]
@tuNgay SMALLDATETIME , @denNgay SMALLDATETIME
AS
BEGIN
	SELECT MAHD,HOADON.MANV,TenKhachHang,SoNgay,MAP,NgayThanhToan,TongTien
	FROM dbo.HOADON JOIN dbo.PHIEUDANGKY ON PHIEUDANGKY.MAPDK = HOADON.MAPDK JOIN dbo.KHACHHANG ON KHACHHANG.CMND = PHIEUDANGKY.CMND
	WHERE NgayThanhToan<=@denNgay AND NgayThanhToan >=@tuNgay
END

GO
/****** Object:  StoredProcedure [dbo].[USP_getThongTinHoaDonThoiGianLoaiP]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_getThongTinHoaDonThoiGianLoaiP]
@tuNgay SMALLDATETIME , @denNgay SMALLDATETIME
AS
BEGIN
	SELECT MAHD,HOADON.MANV,TenKhachHang,SoNgay,HOADON.MAP,NgayThanhToan,TongTien,PHONG.MALP
	FROM dbo.HOADON JOIN dbo.PHIEUDANGKY ON PHIEUDANGKY.MAPDK = HOADON.MAPDK JOIN dbo.KHACHHANG ON KHACHHANG.CMND = PHIEUDANGKY.CMND
	JOIN dbo.PHONG ON PHONG.MAP = HOADON.MAP JOIN dbo.LOAIPHONG ON LOAIPHONG.MALP = PHONG.MALP
	WHERE NgayThanhToan<=@denNgay AND NgayThanhToan >=@tuNgay
END

GO
/****** Object:  StoredProcedure [dbo].[USP_insertCTPDK]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_insertCTPDK]
@CMND VARCHAR(10),@MAPDK VARCHAR(10),@MAP VARCHAR(10)
AS
BEGIN
	INSERT dbo.CTPDK( CMND, MAPDK, MAP )
	VALUES  ( @CMND,@MAPDK,@MAP)
END

GO
/****** Object:  StoredProcedure [dbo].[USP_insertCTPTB]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_insertCTPTB]
@MALP VARCHAR(10),@MATB VARCHAR(10), @SL INT
AS
BEGIN
	DECLARE @Count INT=0
	SELECT @Count=COUNT(*) FROM dbo.CTPTB WHERE MALP=@MALP AND MATB=@MATB
	IF(@Count<=0)
	BEGIN
	INSERT dbo.CTPTB( MALP, MATB, SoLuong )
	VALUES  (@MALP,@MATB,@SL)
	END
    ELSE
    BEGIN
		UPDATE dbo.CTPTB SET SoLuong=@SL WHERE MALP=@MALP AND MATB=@MATB
	END
    
END

GO
/****** Object:  StoredProcedure [dbo].[USP_insertHoaDon]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_insertHoaDon]
@MAHD VARCHAR(10),@MAPDK VARCHAR(10),@MANV VARCHAR(10), @SoNgay FLOAT,@NgayThanhToan SMALLDATETIME, @TongTien FLOAT,@MAP VARCHAR(10)
AS
BEGIN
	INSERT dbo.HOADON( MAHD ,MAPDK ,MANV ,SoNgay ,NgayThanhToan ,TongTien,MAP)
	VALUES  ( @MAHD,@MAPDK,@MANV,@SoNgay,@NgayThanhToan,@TongTien,@MAP)
END

GO
/****** Object:  StoredProcedure [dbo].[USP_insertKhachHang]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_insertKhachHang]
@cmnd VARCHAR(10),@tenkhachhang NVARCHAR(40),@gioitnh INT, @sdt VARCHAR(12),@diachi NVARCHAR(40), @maqt VARCHAR(10)
AS
BEGIN 
INSERT INTO dbo.KHACHHANG( CMND ,TenKhachHang ,GioiTinh , SoDienThoai ,DiaChi ,MAQT)
VALUES  ( @cmnd ,@tenkhachhang ,@gioitnh ,@sdt , @diachi ,@maqt)
END

GO
/****** Object:  StoredProcedure [dbo].[USP_insertLoaiPhong]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_insertLoaiPhong]
@MALP VARCHAR(10), @TenLP NVARCHAR(40),@Gia FLOAT
AS
BEGIN
	INSERT dbo.LOAIPHONG( MALP, TenLP, Gia )VALUES  ( @MALP,@TenLP,@Gia )
END

GO
/****** Object:  StoredProcedure [dbo].[USP_insertNhanVien]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_insertNhanVien]
@MANV VARCHAR(10),@TenNV NVARCHAR(40),@Gioitinh INT ,@NgaySinh DATE,@SDT VARCHAR(12),@DiaChi NVARCHAR(40),@MatKhau VARCHAR(200),@MACV VARCHAR(10)
AS
BEGIN
	INSERT dbo.NHANVIEN( MANV ,TenNV ,GioiTinh ,NgaySinh ,SDT ,DiaChi ,MatKhauDangNhap ,MACV)
	VALUES  ( @MANV,@TenNV,@Gioitinh,@NgaySinh,@SDT,@DiaChi,@MatKhau,@MACV)
END

GO
/****** Object:  StoredProcedure [dbo].[USP_insertPhieuDangKy]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_insertPhieuDangKy]
@MAPDK VARCHAR(10), @CMND VARCHAR(10),@MANV VARCHAR(10),@ThoiGianDen SMALLDATETIME,@ThoiGianDi SMALLDATETIME, @TrangThai INT
AS
BEGIN
	INSERT dbo.PHIEUDANGKY( MAPDK ,CMND ,MANV ,ThoiGianDen ,ThoiGianDi ,TrangThai)
	VALUES  ( @MAPDK ,@CMND , @MANV ,@ThoiGianDen ,@ThoiGianDi ,@TrangThai)
END

GO
/****** Object:  StoredProcedure [dbo].[USP_insertPhong]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_insertPhong]
@MAP VARCHAR(10),@TenPhong NVARCHAR(40),@TinhTrang INT, @GhiChu NVARCHAR(200), @SoKhachToiDa INT,@MALP VARCHAR(10)
AS
BEGIN
INSERT dbo.PHONG( MAP ,TenPhong ,TinhTrang ,GhiChu ,SoKhachToiDa ,MALP)
VALUES  ( @MAP, @TenPhong,@TinhTrang  ,@GhiChu ,@SoKhachToiDa,@MALP )
END

GO
/****** Object:  StoredProcedure [dbo].[USP_insertThietBi]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_insertThietBi]
@MATB VARCHAR(10), @TenTb NVARCHAR(40)
AS
BEGIN
	INSERT dbo.THIETBI ( MATB, TenTB )VALUES  ( @MATB,@TenTb)
END

GO
/****** Object:  StoredProcedure [dbo].[USP_isTonTaiCTPDK]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_isTonTaiCTPDK]
@CMND VARCHAR(10), @MAPDK VARCHAR(10), @MAP VARCHAR(10)
AS
BEGIN
	SELECT COUNT(*) FROM dbo.CTPDK WHERE MAPDK=@MAPDK AND CMND=@CMND AND MAP=@MAP
END

GO
/****** Object:  StoredProcedure [dbo].[USP_isTonTaiHoaDon]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_isTonTaiHoaDon]
@mahd VARCHAR(10)
AS
BEGIN
	SELECT COUNT(*)FROM dbo.HOADON WHERE MAHD=@mahd
END

GO
/****** Object:  StoredProcedure [dbo].[USP_isTonTaiLoaiPhong]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_isTonTaiLoaiPhong]
@MALP VARCHAR(10)
AS
BEGIN
	SELECT COUNT(*)FROM dbo.LOAIPHONG WHERE MALP=@MALP
END

GO
/****** Object:  StoredProcedure [dbo].[USP_isTonTaiPhieuDangKy]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_isTonTaiPhieuDangKy]
@mapdk VARCHAR(10)
AS
BEGIN
	SELECT COUNT(*) FROM dbo.PHIEUDANGKY WHERE MAPDK=@mapdk
END

GO
/****** Object:  StoredProcedure [dbo].[USP_isTonTaiPhong]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_isTonTaiPhong]
@MAP VARCHAR(10)
AS
BEGIN
	SELECT COUNT(*) FROM dbo.PHONG WHERE MAP=@MAP
END

GO
/****** Object:  StoredProcedure [dbo].[USP_isTonTaiQuocTich]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_isTonTaiQuocTich]
@MAQT VARCHAR(10)
AS
BEGIN
	SELECT COUNT(*)FROM dbo.QUOCTICH WHERE MAQT=@MAQT
END

GO
/****** Object:  StoredProcedure [dbo].[USP_isTonTaiThietBi]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_isTonTaiThietBi]
@MATB VARCHAR(10)
AS
BEGIN
	SELECT COUNT(*)FROM dbo.THIETBI WHERE MATB=@MATB
END

GO
/****** Object:  StoredProcedure [dbo].[USP_layDanhSachChucvu]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_layDanhSachChucvu]
AS
BEGIN
SELECT * FROM dbo.CHUCVU
END

GO
/****** Object:  StoredProcedure [dbo].[USP_LayDanhSachPhongHopLe]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LayDanhSachPhongHopLe]
@tungay SMALLDATETIME, @denngay SMALLDATETIME
AS
BEGIN
SELECT * FROM dbo.PHONG WHERE MAP NOT IN (SELECT MAP FROM dbo.CTPDK JOIN dbo.PHIEUDANGKY
ON PHIEUDANGKY.MAPDK = CTPDK.MAPDK WHERE (ThoiGianDen<=@denngay AND ThoiGianDen >= @tungay)OR  (ThoiGianDen<=@tungay AND ThoiGianDi>=@tungay) OR (ThoiGianDen<=@denngay AND ThoiGianDi>=@denngay))
END

GO
/****** Object:  StoredProcedure [dbo].[USP_LayDanhSachPhongHopLeKhacPhong]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_LayDanhSachPhongHopLeKhacPhong]
@MAP VARCHAR(10),@tungay SMALLDATETIME, @denngay SMALLDATETIME
AS
BEGIN
SELECT * FROM dbo.PHONG WHERE MAP NOT IN (SELECT MAP FROM dbo.CTPDK JOIN dbo.PHIEUDANGKY
ON PHIEUDANGKY.MAPDK = CTPDK.MAPDK WHERE ((ThoiGianDen<=@denngay AND ThoiGianDen >= @tungay)OR(ThoiGianDen<=@tungay AND ThoiGianDi>=@tungay) OR (ThoiGianDen<=@denngay AND ThoiGianDi>=@denngay))AND MAP<>@MAP)
END

GO
/****** Object:  StoredProcedure [dbo].[USP_LayTatCaThietBi]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_LayTatCaThietBi]
AS
BEGIN
	SELECT *FROM dbo.THIETBI 
END

GO
/****** Object:  StoredProcedure [dbo].[USP_LayTheoMaChucvu]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LayTheoMaChucvu]
@macv VARCHAR(10)
AS
BEGIN
SELECT * FROM dbo.CHUCVU WHERE MACV = @macv
END

GO
/****** Object:  StoredProcedure [dbo].[USP_layTheoTenKhachHang]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_layTheoTenKhachHang]
@ten NVARCHAR(40)
AS
BEGIN
	DECLARE @TenKh NVARCHAR(40)='%'+dbo.fuConvertToUnsign1(@ten)+'%'
	SELECT *FROM dbo.KHACHHANG WHERE dbo.fuConvertToUnsign1(TenKhachHang)LIKE @TenKh
END

GO
/****** Object:  StoredProcedure [dbo].[USP_LayTheoTenThietBi]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LayTheoTenThietBi]
@TenTB NVARCHAR(40)
AS
BEGIN
	DECLARE @ten NVARCHAR(40) = '%'+dbo.fuConvertToUnsign1(@TenTB)+'%'

	SELECT *FROM dbo.THIETBI WHERE dbo.fuConvertToUnsign1(TenTB) LIKE @ten
END

GO
/****** Object:  StoredProcedure [dbo].[USP_layTheoThietBiPhong]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_layTheoThietBiPhong]
@MATB VARCHAR(10)
AS
BEGIN
	SELECT *FROM dbo.PHONG WHERE MALP IN (SELECT MALP FROM dbo.CTPTB WHERE MATB =@MATB)
END

GO
/****** Object:  StoredProcedure [dbo].[USP_soLuongCTPTBtheoMALP]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_soLuongCTPTBtheoMALP]
@MALP VARCHAR(10)
AS
BEGIN
	SELECT COUNT(*)from dbo.CTPTB WHERE MALP=@MALP
END

GO
/****** Object:  StoredProcedure [dbo].[USP_themQuocTich]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_themQuocTich]
@MAQT VARCHAR(10),@TenNuoc NVARCHAR(40)
AS
BEGIN
	INSERT dbo.QUOCTICH( MAQT, TenNuoc )
	VALUES  ( @MAQT,@TenNuoc)
END

GO
/****** Object:  StoredProcedure [dbo].[USP_updateDaDenPhieuDangKy]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_updateDaDenPhieuDangKy]
@MAPDK VARCHAR(10)
AS
BEGIN
	UPDATE dbo.PHIEUDANGKY SET TrangThai=1,ThoiGianDen=GETDATE() WHERE MAPDK=@MAPDK
	UPDATE dbo.PHONG SET TinhTrang=1 WHERE MAP IN (SELECT MAP FROM dbo.CTPDK WHERE MAPDK=@MAPDK)
  
END

GO
/****** Object:  StoredProcedure [dbo].[USP_updateKhachHang]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_updateKhachHang]
@cmnd VARCHAR(10),@tenkhachhang NVARCHAR(40),@gioitnh INT, @sdt VARCHAR(12),@diachi NVARCHAR(40), @maqt VARCHAR(10)
AS
BEGIN 
UPDATE dbo.KHACHHANG SET TenKhachHang=@tenkhachhang,GioiTinh=@gioitnh,SoDienThoai=@sdt,DiaChi=@diachi,MAQT=@maqt WHERE CMND=@cmnd
END

GO
/****** Object:  StoredProcedure [dbo].[USP_updateLoaiPhong]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_updateLoaiPhong]
@MALP VARCHAR(10), @TenLP NVARCHAR(40),@Gia FLOAT
AS
BEGIN
	UPDATE dbo.LOAIPHONG SET TenLP=@TenLP, Gia=@Gia WHERE MALP=@MALP
END

GO
/****** Object:  StoredProcedure [dbo].[USP_updateMatKhauNhanVien]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_updateMatKhauNhanVien]
@manv VARCHAR(10), @matkhau VARCHAR(200)
AS
BEGIN
	UPDATE dbo.NHANVIEN SET MatKhauDangNhap = @matkhau WHERE MANV=@manv
END

GO
/****** Object:  StoredProcedure [dbo].[USP_updateNhanVien]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_updateNhanVien]
@manv VARCHAR(10),@TenNV NVARCHAR(40),@GioiTinh INT,@ngaysinh DATE,@SDT VARCHAR(12), @diaChi NVARCHAR(40)
AS
BEGIN
	UPDATE dbo.NHANVIEN SET TenNV=@TenNV,GioiTinh = @GioiTinh,SDT = @SDT,NgaySinh=@ngaysinh,DiaChi=@diaChi WHERE MANV =@manv
END

GO
/****** Object:  StoredProcedure [dbo].[USP_updateNhanVienAll]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_updateNhanVienAll]
@manv VARCHAR(10),@TenNV NVARCHAR(40),@GioiTinh INT,@ngaysinh DATE,@SDT VARCHAR(12), @diaChi NVARCHAR(40),@macv VARCHAR(10)
AS
BEGIN
	UPDATE dbo.NHANVIEN SET TenNV=@TenNV,GioiTinh = @GioiTinh,SDT = @SDT,NgaySinh=@ngaysinh,DiaChi=@diaChi,MACV=@macv WHERE MANV =@manv
END

GO
/****** Object:  StoredProcedure [dbo].[USP_updatePhong]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_updatePhong]
@MAP VARCHAR(10),@TenPhong NVARCHAR(40),@TinhTrang INT, @GhiChu NVARCHAR(200), @SoKhachToiDa INT,@MALP VARCHAR(10)
AS
BEGIN
UPDATE dbo.PHONG SET TenPhong=@TenPhong,TinhTrang=@TinhTrang,GhiChu=@GhiChu,SoKhachToiDa=@SoKhachToiDa,MALP=@MALP WHERE MAP=@MAP
END

GO
/****** Object:  StoredProcedure [dbo].[USP_updateQuocTich]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_updateQuocTich]
@MAQT VARCHAR(10),@TenNuoc NVARCHAR(40)
AS
BEGIN
	UPDATE dbo.QUOCTICH SET TenNuoc = @TenNuoc WHERE MAQT =@MAQT
END

GO
/****** Object:  StoredProcedure [dbo].[USP_updateThamSo]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_updateThamSo]
@TLNNN FLOAT, @TLNT3 FLOAT
AS
BEGIN
	UPDATE dbo.ThamSo SET TyLePhuThuKhachThu3=@TLNT3,TyLePhuThuKhachNuocNgoai=@TLNNN
END

GO
/****** Object:  StoredProcedure [dbo].[USP_updateThietBi]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_updateThietBi]
@MATB VARCHAR(10), @TenTb NVARCHAR(40)
AS
BEGIN
	UPDATE dbo.THIETBI SET TenTB=@TenTb WHERE MATB=@MATB
END

GO
/****** Object:  StoredProcedure [dbo].[USP_updateThoiGianPhieuDangKy]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_updateThoiGianPhieuDangKy]
@maPDK VARCHAR(10),@ThoiGianDen SMALLDATETIME, @thoiGianDi SMALLDATETIME
AS
BEGIN
	UPDATE dbo.PHIEUDANGKY SET ThoiGianDen=@ThoiGianDen, ThoiGianDi=@thoiGianDi WHERE MAPDK=@maPDK
END

GO
/****** Object:  Trigger [dbo].[UTG_insertHoaDon]    Script Date: 09/06/2017 3:26:44 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[UTG_insertHoaDon] ON [dbo].[HOADON] FOR INSERT
AS
BEGIN
	DECLARE @MAP VARCHAR(10)
	DECLARE @MAPDK VARCHAR(10)
	SELECT @MAP = MAP , @MAPDK = Inserted.MAPDK FROM Inserted
	UPDATE dbo.PHONG SET TinhTrang =0 WHERE MAP=@MAP
	UPDATE dbo.PHIEUDANGKY SET ThoiGianDi = GETDATE() WHERE MAPDK=@MAPDK
END

GO
ALTER TABLE [dbo].[HOADON] ENABLE TRIGGER [UTG_insertHoaDon]
GO
