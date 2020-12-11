package QLKH.models;

import javax.persistence.*;
import java.sql.Date;
import java.util.List;

@Entity
@Table(name = "NhanVien")
public class NhanVien {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int MaNhanVien;
    private String TenNhanVien;
    private  String TenDangNhap;
    private  String MatKhau;
    private String QueQuan;
    private Date NgaySinh;
    private String So_CMND;
    private String Email;
    private String SDT;
    private String Phai;
    @ManyToOne
    @JoinColumn(name = "ID_Nhom", referencedColumnName = "ID")
    private NhomNhanVien nhomNhanVien;

    @OneToMany
    @JoinColumn(name = "MaNhanVien", referencedColumnName = "NV_Tao")
    private List<MatHang> MatHangs;

    @OneToMany
    @JoinColumn(name="MaNhanVien",referencedColumnName = "MaNV_NhapKho")
    private List<HangHoa> HangNhapKho;

    @OneToMany
    @JoinColumn(name="MaNhanVien",referencedColumnName = "MaNV_XuatKho")
    private List<HangHoa> HangXuatKho;


    @OneToMany
    @JoinColumn(name="MaNhanVien",referencedColumnName = "MaNV_KiemKe")
    private List<HangHoa> HangKiemKe;


   @OneToMany
    @JoinColumn(name = "MaNhanVien", referencedColumnName = "Ma_NhanVien_Nhap")
    private List<PhieuNhapHang> PhieuNhapHangs;

    @OneToMany
    @JoinColumn(name="MaNhanVien",referencedColumnName = "Ma_NhanVien_Xuat")
    private List<PhieuXuatHang> PhieuXuatHangs;


    public int getMaNhanVien(){
        return MaNhanVien;
    }
    public void setMaNhanVien(int maNhanVien){
        this.MaNhanVien=maNhanVien;
    }

    public String getTenNhanVien(){
        return TenNhanVien;
    }
    public void setTenNhanVien(String tenNhanVien){
        this.TenNhanVien=tenNhanVien;
    }

    public String getTenDangNhap(){
        return  TenDangNhap;
    }
    public void setTenDangNhap(String tenDangNhap){
        this.TenDangNhap=tenDangNhap;
    }

    public String getMatKhau(){
        return MatKhau;
    }
    public void setMatKhau(String matKhau){
        this.MatKhau=matKhau;
    }

    public String getQueQuan(){
        return  QueQuan;
    }
    public void setQueQuan(String queQuan){
        this.QueQuan=queQuan;
    }

    public String getSo_CMND(){
        return So_CMND;
    }
    public void setSo_CMND(String so_CMND){
        this.So_CMND=so_CMND;
    }

    public String getEmail(){
        return  Email;
    }
    public void setEmail(String email){
        this.Email=email;
    }

    public String getSDT(){
        return SDT;
    }
    public void setSDT(String SDT){
        this.SDT=SDT;
    }

    public String getPhai(){
        return Phai;
    }
    public void setPhai(String phai){
        this.Phai=phai;
    }

    public Date getNgaySinh(){
        return NgaySinh;
    }
    public void setNgaySinh(Date ngaySinh){
        this.NgaySinh=ngaySinh;
    }

    public List<MatHang> getMatHangs(){
        return MatHangs;
    }
    public void setMatHangs(List<MatHang> matHangs){
        this.MatHangs=matHangs;
    }

    public NhomNhanVien getNhomNhanVien(){
        return nhomNhanVien;
    }
    public void setNhomNhanVien(NhomNhanVien nhomNhanVien){
        this.nhomNhanVien=nhomNhanVien;
    }

   public List<PhieuNhapHang> getPhieuNhapHangs(){
        return  PhieuNhapHangs;
    }
    public void setPhieuNhapHangs(List<PhieuNhapHang> phieuNhapHangs){
       this.PhieuNhapHangs=phieuNhapHangs;
    }

    public List<HangHoa> getHangKiemKe(){
        return  HangKiemKe;
    }
    public void setHangKiemKe(List<HangHoa> hangKiemKe){
        this.HangKiemKe=hangKiemKe;
    }

    public List<HangHoa> getHangNhapKho(){
        return  HangNhapKho;
    }
    public void setHangNhapKho(List<HangHoa> hangNhapKho){
        this.HangNhapKho=hangNhapKho;
    }

    public List<HangHoa> getHangXuatKho(){
        return  HangXuatKho;
    }
    public void setHangXuatKho(List<HangHoa> hangXuatKho){
        this.HangXuatKho=hangXuatKho;
    }

    public List<PhieuXuatHang> getPhieuXuatHangs(){
        return  PhieuXuatHangs;
    }
    public void setPhieuXuatHangs(List<PhieuXuatHang> phieuXuatHangs){
        this.PhieuXuatHangs=phieuXuatHangs;
    }


}
