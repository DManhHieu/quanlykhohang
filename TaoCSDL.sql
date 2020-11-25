Create database QLKHnew
use QLKHnew
Go
Create table NhomNhanVien
(
	ID nvarchar(30) not null,
	TenNhom nvarchar(50) not null,
	primary key(ID)
)
Go
Create table NhanVien
(
	ID_Nhom nvarchar(30) not null references NhomNhanVien(ID),
	MaNhanVien nvarchar(30) not null,
	TenNhanVien nvarchar(50) not null,
	QueQuan nvarchar(100),
	TenDangNhap nvarchar(50) not null,
	NgaySinh date,
	MatKhau varchar(30) not null,
	So_CMND varchar(50) not null,
	Email varchar(100),
	SDT varchar(30),
	Primary key (MaNhanVien)
)
Go
Create table PhieuNhapHang
(
	MaPhieu nvarchar(100) not null,
	NgayNhap smalldatetime not null,
	MoTa nvarchar(200),
	NhanVien_Nhap nvarchar(30) references NhanVien(MaNhanVien),
	primary key (MaPhieu)
)
Go
Create table PhieuXuatHang
(
	MaPhieu nvarchar(100) not null,
	MoTa nvarchar(200),
	NgayTao smalldatetime not null,
	NgayXuat_DuKien smalldatetime not null,
	NgayXuat_ThucTe smalldatetime not null,
	NhanVien_Xuat nvarchar(30) references NhanVien(MaNhanVien),
	primary key (MaPhieu)
)
Go
Create table MatHang
(
	MaMatHang nvarchar(100) not null,
	NhaSanXuat nvarchar(50) ,
	TenMatHang nvarchar(50) not null,
	MoTa nvarchar(200),
	GiaTri money,
	NV_Tao nvarchar(30) references NhanVien(MaNhanVien),
	primary key (MaMatHang),
)
Go
Create table HangNhap
(
	SoLuong int not null,
	MP_Nhap nvarchar(100) not null references PhieuNhapHang (MaPhieu),
	MaHangNhap nvarchar(100) not null references MatHang (MaMatHang),
	Primary key (MP_Nhap,MaHangNhap)
)
Go
Create table HangHoa
(
	MaHangHoa nvarchar(100) not null,
	MaNV_KiemKe nvarchar(30) not null,
	Ngay_KiemKe date not null,
	HanSuDung date not null,
	NgaySanXuat date not null,
	ViTri nvarchar(100),
	NgayNhapKho smalldatetime not null,
	MaMatHang nvarchar(100) references MatHang (MaMatHang ),
	MP_NhapHang nvarchar(100) not null references PhieuNhapHang (MaPhieu),
	MP_XuatHang nvarchar(100) not null references PhieuXuatHang (MaPhieu),
	MaNV_NhapKho nvarchar(30) not null references NhanVien (MaNhanVien),
	MaNV_XuatKho nvarchar(30) not null references NhanVien (MaNhanVien),
	primary key (MaHangHoa)
)
Go
Create table TinhTrang
(
	MaTinhTrang nvarchar(50) not null,
	TenTinhTrang nvarchar(50) not null,
	Ma_HangHoa nvarchar(100) not null references HangHoa (MaHangHoa),
	primary key (MaTinhTrang)
)