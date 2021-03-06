USE heroku_43bcd52ba381685;
Create Table NhomNhanVien
(
	ID int,
	TenNhom nvarchar(50) not null,
	primary key(ID)
);

Create table NhanVien
(
	ID_Nhom int not null references NhomNhanVien(ID),
	MaNhanVien int not null,
	TenNhanVien nvarchar(50) not null,
	QueQuan nvarchar(100),
	TenDangNhap nvarchar(50) not null,
	NgaySinh date,
	MatKhau varchar(30) not null,
	So_CMND varchar(50) not null,
	Email varchar(100),
	SDT varchar(30),
    	Phai nvarchar(5) not null,
	Primary key (MaNhanVien)
);

Create table PhieuNhapHang
(
	MaPhieu nvarchar(100) not null,
	NgayNhap datetime not null,
	MoTa nvarchar(200),
    	NhapTu nchar(50),
	Ma_NhanVien_Nhap int references NhanVien(MaNhanVien),
	primary key (MaPhieu)
);

Create table PhieuXuatHang
(
	MaPhieu nvarchar(100) not null,
	MoTa nvarchar(200),
	NgayTao datetime not null,
	NgayXuat_DuKien datetime not null,
	NgayXuat_ThucTe datetime not null,
	Ma_NhanVien_Xuat int references NhanVien(MaNhanVien),
	primary key (MaPhieu)
);

Create table MatHang
(
	MaMatHang nvarchar(100) not null,
	NhaSanXuat nvarchar(50) not null,
	TenMatHang nvarchar(50) not null,
	MoTa nvarchar(200) ,
	GiaTri double not null,
	NV_Tao int not null references NhanVien(MaNhanVien),
	primary key (MaMatHang)
);

Create table HangNhap
(
	SoLuong int not null,
	MP_Nhap nvarchar(100) not null references PhieuNhapHang (MaPhieu),
	MaHangNhap nvarchar(100) not null references MatHang (MaMatHang),
	Primary key (MP_Nhap,MaHangNhap)
);
Create table HangHoa
(
	MaHangHoa nvarchar(100) not null,
	MaNV_KiemKe int null,
	Ngay_KiemKe date null,
	HanSuDung date not null,
	NgaySanXuat date not null,
	ViTri nvarchar(100),
	NgayNhapKho date not null,
	MaMatHang nvarchar(100) references MatHang (MaMatHang ),
	MP_NhapHang nvarchar(100) not null references PhieuNhapHang (MaPhieu),
	MP_XuatHang nvarchar(100) references PhieuXuatHang (MaPhieu),
	MaNV_NhapKho int not null references NhanVien (MaNhanVien),
	MaNV_XuatKho int references NhanVien (MaNhanVien),
	MaTinhTrang int not null references TinhTrang (MaTinhTrang),
	primary key (MaHangHoa)
);

Create table TinhTrang
(
	MaTinhTrang int not null,
	TenTinhTrang nvarchar(50) not null,
	primary key (MaTinhTrang)
)